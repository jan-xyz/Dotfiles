-- Treesitter:
local tree_sitter = require("nvim-treesitter.configs")

tree_sitter.setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	},
})
