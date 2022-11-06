local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
lsp_installer.on_server_ready(function(server)

	local opts = {
		on_attach = require("mark.lsp.handlers").on_attach,
		capabilities = require("mark.lsp.handlers").capabilities,
	}

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("mark.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)

	elseif server.name == "denols" then
		-- Augment vim.g.markdown_fenced_languages to appropriately highlight codefences returned from denols 
		vim.g.markdown_fenced_languages = { "ts=typescript" }

		local deno_opts = require("mark.lsp.settings.denols")
		opts = vim.tbl_deep_extend("force", deno_opts, opts)

	elseif server.name == "texlab" then
		local texlab_opts = require("mark.lsp.settings.texlab")
		opts = vim.tbl_deep_extend("force", texlab_opts, opts)

	else
		return
	end

	-- This setup() function is exactly the same as lspconfig's setup
	server:setup(opts)
end)
