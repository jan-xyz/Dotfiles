local packer = require("packer")
packer.use({
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		-- Treesitter:
		local tree_sitter = require("nvim-treesitter.configs")

		tree_sitter.setup({
			ensure_installed = "all",

			-- phpdoc is a language that is not supported on arm64.
			-- See: https://github.com/claytonrcarter/tree-sitter-phpdoc/issues/15
			ignore_install = { "phpdoc" },
			highlight = {
				enable = true,
			},
		})
	end,
})
