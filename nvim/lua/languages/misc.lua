local packer = require("packer")

packer.use({
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local lsp = require("lsp.config")
		require("null-ls").setup({
			on_attach = lsp.on_attach,
			sources = {
				-- Coda Actions
				require("null-ls").builtins.code_actions.shellcheck,

				-- Diagnostics
				require("null-ls").builtins.diagnostics.buf,
				require("null-ls").builtins.diagnostics.markdownlint,
				require("null-ls").builtins.diagnostics.shellcheck,
				-- Formatting
				-- require("null-ls").builtins.formatting.stylua,
				require("null-ls").builtins.formatting.shfmt,
				-- TODO: still doesn't properly work
				--require("null-ls").builtins.formatting.buf,
				require("null-ls").builtins.formatting.markdownlint,

				-- Completions
				require("null-ls").builtins.completion.spell,
			},
		})
	end,
})
