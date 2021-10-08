local nvim_lsp = require("lspconfig")
local lsp = require("lsp.config")

-- YAML
nvim_lsp.yamlls.setup({
	on_attach = lsp.on_attach,
	settings = {
		yaml = {
			validate = true,
			formate = { enabled = true },
			schemas = {
				["https://json.schemastore.org/dependabot-2.0"] = ".github/dependabot.{yml,yaml}",
				["https://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
				["https://json.schemastore.org/github-action"] = ".github/**/action.{yml,yaml}",
				["https://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
				["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.2-standalone-strict/all.json"] = "**/*.k8s.{yml,yaml}",
			},
			customTags = {
				"!And scalar",
				"!And mapping",
				"!And sequence",
				"!If scalar",
				"!If mapping",
				"!If sequence",
				"!Not scalar",
				"!Not mapping",
				"!Not sequence",
				"!Equals scalar",
				"!Equals mapping",
				"!Equals sequence",
				"!Or scalar",
				"!Or mapping",
				"!Or sequence",
				"!FindInMap scalar",
				"!FindInMap mappping",
				"!FindInMap sequence",
				"!Base64 scalar",
				"!Base64 mapping",
				"!Base64 sequence",
				"!Cidr scalar",
				"!Cidr mapping",
				"!Cidr sequence",
				"!Ref scalar",
				"!Ref mapping",
				"!Ref sequence",
				"!Sub scalar",
				"!Sub mapping",
				"!Sub sequence",
				"!GetAtt scalar",
				"!GetAtt mapping",
				"!GetAtt sequence",
				"!GetAZs scalar",
				"!GetAZs mapping",
				"!GetAZs sequence",
				"!ImportValue scalar",
				"!ImportValue mapping",
				"!ImportValue sequence",
				"!Select scalar",
				"!Select mapping",
				"!Select sequence",
				"!Split scalar",
				"!Split mapping",
				"!Split sequence",
				"!Join scalar",
				"!Join mapping",
				"!Join sequence",
			},
		},
	},
})
