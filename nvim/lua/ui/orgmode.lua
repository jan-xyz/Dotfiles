local packer = require("packer")

packer.use({
	"nvim-neorg/neorg",
	config = function()
		require("neorg").setup({
			-- check out setup part...
		})
	end,
	requires = "nvim-lua/plenary.nvim",
})
