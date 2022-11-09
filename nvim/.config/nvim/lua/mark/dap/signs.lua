-- `DapBreakpoint` for breakpoints (default: `B`)
vim.fn.sign_define('DapBreakpoint', {text='●', texthl='DapSignBreakpoint', linehl='', numhl=''})

-- `DapBreakpointCondition` for conditional breakpoints (default: `C`)
vim.fn.sign_define('DapBreakpointCondition', {text='●', texthl='', linehl='', numhl=''})

-- `DapLogPoint` for log points (default: `L`)
vim.fn.sign_define('DapLogPoint', {text='●', texthl='', linehl='', numhl=''})

-- `DapStopped` to indicate where the debugee is stopped (default: `→`)
vim.fn.sign_define('DapStopped', {text='→', texthl='', linehl='', numhl=''})

-- `DapBreakpointRejected` to indicate breakpoints rejected by the debug adapter (default: `R`)
vim.fn.sign_define('DapBreakpointInjected', {text='●', texthl='', linehl='', numhl=''})
