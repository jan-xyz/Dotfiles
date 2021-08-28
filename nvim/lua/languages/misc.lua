local nvim_lsp = require("lspconfig")
local lsp = require("lsp.config")

-- EFM (general purpose language server)
nvim_lsp.efm.setup({
	on_attach = lsp.on_attach,
	init_options = { documentFormatting = true },
	filetypes = { "sh", "lua", "markdown", "proto" },
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			sh = {
				{
					formatCommand = "shfmt -ci -s -bn",
					formatStdin = true,
				},
				{
					lintCommand = "shellcheck -f gcc -x",
					lintSource = "shellcheck",
					lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" },
				},
			},
			lua = {
				{ formatCommand = "stylua -", formatStdin = true },
			},
			markdown = {
				{
					lintCommand = "markdownlint --stdin",
					lintStdin = true,
					lintFormats = {
						"%f:%l:%c %m",
						"%f:%l %m",
						"%f: %l: %m",
					},
				},
			},
			proto = {
				{
					lintCommand = "buf lint --path ${INPUT}",
					lintStdin = true,
					lintFormats = {
						"%f:%l:%c:%m",
					},
				},
			},
		},
	},
})
