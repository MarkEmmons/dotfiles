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

-- Signs
require("mark.lang.dap.signs")

-- UI
local dapui = require("mark.lang.dap.nvim-dap-ui")

if dapui then
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
		require('neotest').summary.close()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

require("mark.lang.dap.keymaps")
