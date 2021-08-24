local packer = require("packer")
local use = packer.use

packer.reset()
packer.init({
	display = {
		open_fn = require("packer.util").float,
	},
})

-- UX
use({ "famiu/nvim-reload", requires = "nvim-lua/plenary.nvim" })
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
use({
	"norcalli/nvim-colorizer.lua",
})

-- LSP
use("neovim/nvim-lspconfig")
use("nvim-lua/lsp_extensions.nvim")
use("nvim-lua/completion-nvim")
use("simrat39/rust-tools.nvim") -- LSP server extensions for Rust

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
use({
	"glepnir/galaxyline.nvim",
	branch = "main",
	-- your statusline
	config = function()
		require("statusline_config")
	end,
	requires = { "kyazdani42/nvim-web-devicons", opt = true },
})
use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } })

-- Git support
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
