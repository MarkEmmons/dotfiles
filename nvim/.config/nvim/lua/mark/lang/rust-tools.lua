local rust_ok, rt = pcall(require, "rust-tools")
if not rust_ok then
	return
end

local extension_path = vim.env.HOME .. '/.vscode-oss/extensions/vadimcn.vscode-lldb-1.8.1-universal'
local codelldb_path = extension_path .. '/adapter/codelldb'
local liblldb_path = extension_path .. '/lldb/lib/liblldb.so'

local opts = {

	dap = {
		adapter = require('rust-tools.dap')
			.get_codelldb_adapter(codelldb_path, liblldb_path)
	},
	server = {

		on_attach = function(client, bufnr)

			local keymap = vim.api.nvim_buf_set_keymap
			local opts = { noremap = true, silent = true }

			require("nvim-navic").attach(client, bufnr)
			require("mark.lang.lsp.handlers").LspKeymaps(bufnr)
			require("mark.lang.lsp.handlers").LspHighlightDocument(client)

			keymap(bufnr, "n", "<Leader>1", "<cmd>RustEnableInlayHints<CR>", opts)
			keymap(bufnr, "n", "<Leader>2", "<cmd>RustDisableInlayHints<CR>", opts)
			keymap(bufnr, "n", "<Leader>3", "<cmd>RustSetInlayHints<CR>", opts)
			keymap(bufnr, "n", "<Leader>4", "<cmd>RustUnsetInlayHints<CR>", opts)
		end,
	},
	tools = {

		inlay_hints = {
			auto = false,	-- Doesn't work :/
		},
	},
}

rt.setup(opts)
