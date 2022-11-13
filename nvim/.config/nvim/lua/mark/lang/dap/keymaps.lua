local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Get nearest test							[x]
-- Get test binary							[x]
-- Call test binary with --test <test_name>	[]

keymap("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
keymap("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)

keymap("n", "<Leader>D", "<Cmd>lua require'dapui'.toggle()<CR>", opts)

keymap("n", "<Leader>DT", "<Cmd>lua require'dapui'.toggle()<CR>", opts)
