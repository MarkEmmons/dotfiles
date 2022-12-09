local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
	return
end

--- Adapters ---
dap.adapters.nlua = function(callback, config)
	callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
end

dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
	name = 'lldb'
}

dap.adapters.deno = {
	type = 'executable',
	command = 'node',
	args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
}

--require("dap-vscode-js").setup({
--	adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
--})

--- Configurations ---
dap.configurations.lua = {{
	type = 'nlua',
	request = 'attach',
	name = "Attach to running Neovim instance",
}}

dap.configurations.rust = {{
	name = 'Launch',
	type = 'lldb',
	request = 'launch',
	program = function()
		return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
	end,
	cwd = '${workspaceFolder}',
	stopOnEntry = false,
	args = {},
}}

for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
	require("dap").configurations[language] = {
		{
			name = 'Deno',
			type = 'deno',
			request = 'launch',
			cwd = '${workspaceFolder}',
			runtimeExecutable = 'deno',
			--runtimeArgs = { 'test', 'main.test.ts', '--allow-all', '--filter', 'hello world #1', '--inspect-brk' },
			runtimeArgs = { 'run', '--inspect-brk', '--allow-all', "${file}" },
			port = 9229,
			protocol = 'inspector',
		},
		--{
		--	request = 'launch',
		--	name = 'Launch Program',
		--	type = 'pwa-node',
		--	cwd = '${workspaceFolder}',
		--	program = '${file}',
		--	runtimeExecutable = 'deno',
		--	runtimeArgs = { 'run', '--inspect-brk', '--allow-all' },
		--	attachSimplePort = 9229,
		--},
	}
end

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
