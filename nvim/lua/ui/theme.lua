local packer = require("packer")
packer.use({
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup()
	end,
})

packer.use({
	"jan-xyz/nord-vim",
	branch = "jan-xyz-patch-1",
	config = function()
		vim.cmd("colorscheme nord")
	end,
})
