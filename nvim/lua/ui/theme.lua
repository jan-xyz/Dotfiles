local packer = require("packer")
packer.use({
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({})
	end,
})

packer.use({ "arcticicestudio/nord-vim", branch = "master" })
vim.cmd("colorscheme nord") -- Set color scheme
