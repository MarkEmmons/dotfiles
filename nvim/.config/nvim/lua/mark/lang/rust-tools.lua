local rust_ok, rt = pcall(require, "rust-tools")
if not rust_ok then
	return
end

rt.setup({

	server = {

		inlay_hints = {
			auto = false,	-- Doesn't work :/
		},

		on_attach = function(client, bufnr)

			local keymap = vim.api.nvim_buf_set_keymap
			local opts = { noremap = true, silent = true }

			require("mark.lang.lsp.handlers").LspKeymaps(bufnr)
			require("mark.lang.lsp.handlers").LspHighlightDocument(client)

			keymap(bufnr, "n", "<Leader>1", "<cmd>RustEnableInlayHints<CR>", opts)
			keymap(bufnr, "n", "<Leader>2", "<cmd>RustDisableInlayHints<CR>", opts)
			keymap(bufnr, "n", "<Leader>3", "<cmd>RustSetInlayHints<CR>", opts)
			keymap(bufnr, "n", "<Leader>4", "<cmd>RustUnsetInlayHints<CR>", opts)
		end,
	},
})

-- These don't do anything
rt.inlay_hints.disable()
rt.inlay_hints.unset()
