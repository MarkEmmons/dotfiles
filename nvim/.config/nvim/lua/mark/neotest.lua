local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

neotest.setup {
	adapters = {
		require("neotest-rust") {
			args = { "--no-capture" },
		},
	},
	icons = {
		child_indent = "│",
		child_prefix = "├",
		collapsed = "─",
		expanded = "╮",
		failed = "✘",
		final_child_indent = " ",
		final_child_prefix = "╰",
		non_collapsible = "─",
		passed = "✔",
		running = "●",
		running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
		skipped = "➥",
		unknown = "?"
	},
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<Leader>ts", ":lua require('neotest').summary.toggle()<CR>", opts)
keymap("n", "<Leader>tr", ":lua require('neotest').run.run()<CR>", opts)
keymap("n", "<Leader>td", ":lua require('neotest').run.run({strategy = 'dap'})<CR>", opts)
