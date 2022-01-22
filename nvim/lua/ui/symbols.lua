local packer = require("packer")

-- Symbols config
packer.use({
	"liuchengxu/vista.vim",
	config = function()
		vim.g.vista_default_executive = "nvim_lsp"
	end,
})
