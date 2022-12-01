require "mark.editor.autopairs"
require "mark.editor.bufferline"
require "mark.editor.colorscheme"
require "mark.editor.cmp"
require "mark.editor.nvim-tree"
require "mark.editor.telescope"
require "mark.editor.toggleterm"
require "mark.editor.winbar"

require('nvim-cursorline').setup {
	cursorline = {
		enable = false,
	},
	cursorword = {
		enable = true,
		min_length = 3,
		hl = { underline = true },
	}
}
