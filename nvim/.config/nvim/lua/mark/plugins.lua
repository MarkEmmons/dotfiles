local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

---- Use a popup window
--packer .init {
--	display = {
--		open_fn = function()
--			return require("packer.util").float { border = "rounded" }
--		end,
--	},
--}

-- Install plugins
return packer.startup(function(use)

	-- Packer
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/popup.nvim"    -- Popup API for Neovim
	use "nvim-lua/plenary.nvim"  -- Lua functions used by many plugins

	-- Nvim-Dap
	use "mfussenegger/nvim-dap"

	-- Nvim-Tree
	use {
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	}

	-- Bufferline
	use {
		"akinsho/bufferline.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			"moll/vim-bbye",
		},
	}

	-- cmp
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"

	-- snippets
	use "L3MON4D3/LuaSnip" --snippet engine

	-- LSP
	use {
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/nvim-lsp-installer",
		}
	}

	-- rust-tools
	use {
		"simrat39/rust-tools.nvim",
	}

	-- Colorscheme
	use "noahfrederick/vim-noctu" -- Inherit color scheme from the terminal
	use "~/workspace/lua/noc2.nvim" -- Inherit color scheme from the terminal

	-- Autopairs
	use "windwp/nvim-autopairs"

	-- Toggleterm
	use "akinsho/toggleterm.nvim"

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
