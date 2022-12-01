-- Git Conflict
require('git-conflict').setup({
	default_mappings = true,
	disable_diagnostics = false,
	highlights = {
		incoming = 'DiffText',
		curent = 'DiffAdd'
	},
})

require('gitsigns').setup()

require('diffview').setup()

-- Keymaps
--vim.api.nvim_buf_set_keymap(0, 'n', '<C-Space>', "<Cmd>ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
