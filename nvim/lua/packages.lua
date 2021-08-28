local packer = require("packer")

packer.reset()
packer.init({
	display = {
		open_fn = require("packer.util").float,
	},
})

-- UX
packer.use({
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup({
			-- your configuration comes here
			-- or leave it empty to packer.use the default settings
			-- refer to the configuration section below
		})
	end,
})
packer.use("felipec/vim-sanegx")
packer.use({
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({})
	end,
})

-- UI
packer.use({ "arcticicestudio/nord-vim", branch = "master" })
packer.use("majutsushi/tagbar")
packer.use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
packer.use({
	"glepnir/galaxyline.nvim",
	branch = "main",
	-- your statusline
	config = function()
		require("statusline_config")
	end,
	requires = { "kyazdani42/nvim-web-devicons", opt = true },
})
packer.use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } })
