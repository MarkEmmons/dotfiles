require("nvim-navic").setup({ highlight = true })

vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
