local rust_ok, rt = pcall(require, "rust-tools")
if not rust_ok then
	return
end

local opts = { noremap = true, silent = true }

rt.setup({

	server = {

		inlay_hints = {
			auto = false,
		},

		on_attach = function(client, bufnr)

			local keymap = vim.api.nvim_buf_set_keymap

			require("mark.lsp.handlers").LspKeymaps(bufnr)
			require("mark.lsp.handlers").LspHighlightDocument(client)

			keymap(bufnr, "n", "<Leader>1", "<cmd>RustEnableInlayHints<CR>", opts)
			keymap(bufnr, "n", "<Leader>2", "<cmd>RustDisableInlayHints<CR>", opts)
			keymap(bufnr, "n", "<Leader>3", "<cmd>RustSetInlayHints<CR>", opts)
			keymap(bufnr, "n", "<Leader>4", "<cmd>RustUnsetInlayHints<CR>", opts)
		end,
	},
})

rt.inlay_hints.disable()
rt.inlay_hints.unset()

local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
	return
end

dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
	name = 'lldb'
}

local configurations = {
	name = 'Launch',
	type = 'lldb',
	request = 'launch',
	program = function()
	return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
	end,
	cwd = '${workspaceFolder}',
	stopOnEntry = false,
	args = {},
}

dap.configurations.rust = { configurations }

local keymap = vim.api.nvim_set_keymap

keymap("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
keymap("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
--keymap("n", "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
--keymap("n", "<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
--keymap("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)
