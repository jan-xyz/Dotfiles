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
				require("null-ls").builtins.formatting.shfmt,
				-- TODO: doesn't work with format on safe because it works on the
				--       file on disc and overwrites changes on safe.
				--require("null-ls").builtins.formatting.buf,
				require("null-ls").builtins.formatting.markdownlint,
			},
		})
	end,
})
