vim.pack.add({
	"https://github.com/NvChad/nvim-colorizer.lua",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/numToStr/Comment.nvim",
})
require("Comment").setup()
require("colorizer").setup({})
require("ibl").setup({
	scope = {
		highlight = "Keyword",
	},
	exclude = {
		filetypes = {
			"dashboard",
		},
	},
})
