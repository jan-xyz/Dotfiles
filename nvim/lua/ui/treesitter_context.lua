local packer = require("packer")
packer.use({
	"nvim-treesitter/nvim-treesitter-context",
	requires = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("treesitter-context").setup({
			enbaled = true,
			mode = "topline",
		})
	end,
})
