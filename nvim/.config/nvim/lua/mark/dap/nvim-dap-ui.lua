local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
	return nil
end

dapui.setup {
	icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
	mappings = {
		expand = {"<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- Requires >= 0.7
	expand_lines = true,
	layouts = {
		{
			elements = {
				--"watches",
				{id = "breakpoints", size = 0.10},
				"stacks",
				{id = "repl", size = 0.25},
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"scopes",
				--"console",
			},
			size = 0.25,
			position = "bottom",
		},
	},
	controls = {
		enabled = true,
		element = "repl",
		icons = {
			pause = "",
			play = "",
			step_into = "",
			step_over = "",
			step_out = "",
			step_back = "",
			run_last = "↻",
			terminate = "□",
		},
	},
	floating = {
		max_height = nil,
		max_width = nil,
		border = "single",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil,
		max_value_lines = 100,
	}
}

return dapui
