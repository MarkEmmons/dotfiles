local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

--[[
		0	1	2	3	4	5	6	7	8	9	A	B	C	D	E	F
U+250x	─	━	│	┃	┄	┅	┆	┇	┈	┉	┊	┋	┌	┍	┎	┏
U+251x	┐	┑	┒	┓	└	┕	┖	┗	┘	┙	┚	┛	├	┝	┞	┟
U+252x	┠	┡	┢	┣	┤	┥	┦	┧	┨	┩	┪	┫	┬	┭	┮	┯
U+253x	┰	┱	┲	┳	┴	┵	┶	┷	┸	┹	┺	┻	┼	┽	┾	┿
U+254x	╀	╁	╂	╃	╄	╅	╆	╇	╈	╉	╊	╋	╌	╍	╎	╏
U+255x	═	║	╒	╓	╔	╕	╖	╗	╘	╙	╚	╛	╜	╝	╞	╟
U+256x	╠	╡	╢	╣	╤	╥	╦	╧	╨	╩	╪	╫	╬	╭	╮	╯
U+257x	╰	╱	╲	╳	╴	╵	╶	╷	╸	╹	╺	╻	╼	╽	╾	╿
]]--
local double_icons     = { indent = "║", prefix = "╠", collapsed = "═", expanded = "╗", final_indent = " ", final_prefix = "╚", non_collapsible = "─" }
--local curved_icons   = { indent = "│", prefix = "├", collapsed = "─", expanded = "╮", final_indent = " ", final_prefix = "╰", non_collapsible = "─" }
--local straight_icons = { indent = "│", prefix = "├", collapsed = "─", expanded = "┐", final_indent = " ", final_prefix = "└", non_collapsible = "─" }

local icon_set = double_icons

local box_icons = {
	indent = icon_set.indent,
	prefix = icon_set.prefix,
	collapsed = icon_set.collapsed,
	expanded = icon_set.expanded,
	final_indent = icon_set.final_indent,
	final_prefix = icon_set.final_prefix,
	non_collapsible = icon_set.non_collapsible,
}

neotest.setup {
	adapters = {
		require("neotest-deno") {
			--args = { "--coverage=.cov" },
			--allow = { "--allow-read" },
			root_files = { "fresh.gen.ts", "dev.ts" },
			filter_dirs = { "static" },
			--dap_adapter = "pwa-node",
		},
		require("neotest-plenary"),
		require("neotest-rust") {
			args = { "--no-capture" },
		},
	},
	icons = {
		child_indent = box_icons.indent,
		child_prefix = box_icons.prefix,
		collapsed = box_icons.collapsed,
		expanded = box_icons.expanded,
		failed = "✘",
		final_child_indent = icon_set.final_indent,
		final_child_prefix = icon_set.final_prefix,
		non_collapsible = icon_set.non_collapsible,
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
