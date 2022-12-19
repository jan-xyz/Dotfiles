local packer = require("packer")
packer.use({
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		-- Treesitter:
		local tree_sitter = require("nvim-treesitter.configs")

		tree_sitter.setup({
			ensure_installed = "all",
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
})
