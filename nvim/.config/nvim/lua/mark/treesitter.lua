local configs = require("nvim-treesitter.configs")

configs.setup {

	ensure_installed = "all",
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
}
