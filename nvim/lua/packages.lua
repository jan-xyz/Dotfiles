return require("packer").startup({
	function(use)
		-- UX
		use({ "famiu/nvim-reload", requires = "nvim-lua/plenary.nvim" })
		use("nvim-lua/lsp_extensions.nvim")
		use("neovim/nvim-lspconfig")
		use("folke/lua-dev.nvim")
		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				})
			end,
		})
		use("felipec/vim-sanegx")

		-- Debugger
		use("mfussenegger/nvim-dap")
		use({ "theHamsta/nvim-dap-virtual-text", requires = { "mfussenegger/nvim-dap" } })
		use({ "nvim-telescope/telescope-dap.nvim", requires = "mfussenegger/nvim-dap" })

		-- Window Add-Ons
		use({ "arcticicestudio/nord-vim", branch = "master" })
		use("majutsushi/tagbar")
		use("liuchengxu/vista.vim")
		use({ "voldikss/vim-floaterm" })
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use({ "akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons" })
		use({ "hoob3rt/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" })
		use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } })

		-- Git support
		use({ "TimUntersberger/neogit" })
		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("gitsigns").setup({
					numhl = true,
				})
			end,
		})

		-- autocompletion and linting
		use("dense-analysis/ale")
		use("bufbuild/vim-buf")
		use("nvim-lua/completion-nvim")
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
