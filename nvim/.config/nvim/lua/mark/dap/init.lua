local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
	return
end

-- Commands
local dap_cmds = require("mark.dap.commands")

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
		return dap_cmds.get_test_binary()
	end,
	cwd = '${workspaceFolder}',
	stopOnEntry = false,
	args = function()
		return dap_cmds.get_nearest_test()
	end,
}

dap.configurations.rust = { configurations }

-- Signs
require("mark.dap.signs")

-- UI
local dapui = require("mark.dap.nvim-dap-ui")

if dapui then
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

require("mark.dap.keymaps")
