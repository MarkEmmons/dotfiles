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
