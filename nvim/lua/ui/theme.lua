local packer = require("packer")

packer.use({
	"arcticicestudio/nord-vim",
	config = function()
		vim.cmd("colorscheme nord")
	end,
})

packer.use({
	"catppuccin/nvim",
	as = "catppuccin",
})
