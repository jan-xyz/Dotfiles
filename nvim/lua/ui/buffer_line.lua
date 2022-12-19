local packer = require("packer")

packer.use({
	"romgrk/barbar.nvim",
	requires = { "kyazdani42/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			animation = false,
		})
	end,
})
