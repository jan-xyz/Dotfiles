local packer = require("packer")
packer.use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

-- Treesitter:
local tree_sitter = require("nvim-treesitter.configs")

tree_sitter.setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	},
})
