local packer = require("packer")
packer.use({
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup()
	end,
})

packer.use({
	"arcticicestudio/nord-vim",
	branch = "develop",
	config = function()
		vim.cmd("colorscheme nord")
	end,
})

packer.use({
	"catppuccin/nvim",
	as = "catppuccin",
})
