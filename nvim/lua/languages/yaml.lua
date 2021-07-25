local nvim_lsp = require("lspconfig")
local lsp = require("lsp")

-- YAML
nvim_lsp.yamlls.setup({
	on_attach = lsp.on_attach,
	settings = {
		yaml = {
			schemas = {
				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
				["http://json.schemastore.org/github-action"] = ".github/**/action.{yml,yaml}",
				["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
			},
		},
	},
})
