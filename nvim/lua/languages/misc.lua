local packer = require("packer")

packer.use({
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local lsp = require("lsp.config")
		require("null-ls").setup({
			on_attach = lsp.on_attach,
			sources = {

				-- Diagnostics
				require("null-ls").builtins.diagnostics.buf,
				require("null-ls").builtins.diagnostics.markdownlint,
				-- Formatting
				require("null-ls").builtins.formatting.shfmt,
				require("null-ls").builtins.formatting.markdownlint,
			},
		})
	end,
})
