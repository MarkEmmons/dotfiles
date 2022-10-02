local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend)"force", sumneko_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup
	server:setup(opts)
end)
