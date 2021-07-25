local nvim_lsp = require("lspconfig")
local lsp = require("lsp")

-- YAML
nvim_lsp.yamlls.setup({
	on_attach = lsp.on_attach,
	settings = {
		yaml = {
			validate = true,
			formate = { enabled = true },
			schemas = {
				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
				["http://json.schemastore.org/github-action"] = ".github/**/action.{yml,yaml}",
				["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
				["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "**/*.k8s.{yml,yaml}",
			},
		},
	},
})
