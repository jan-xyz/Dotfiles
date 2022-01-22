local packer = require("packer")

-- Markdown Preview
packer.use({
	"iamcco/markdown-preview.nvim",
	run = function()
		vim.fn["mkdp#util#install"]()
	end,
	ft = { "markdown" },
})
