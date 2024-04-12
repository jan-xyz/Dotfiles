local M = {}

function M.setup()
	local nvim_lsp = require("lspconfig")
	local completion = require("cmp_nvim_lsp")

	-- LSP config
	nvim_lsp.rust_analyzer.setup({
		capabilities = completion.default_capabilities(),
		settings = {
			["rust-analyzer"] = {
				cargo = {
					unsetTest = { "core", "derivative" },
				},
				imports = {
					prefix = "crate",
					granularity = {
						enforce = true,
						group = "item",
					},
					allowMergingIntoGlobImports = false,
				},
			},
		},
	})
end

return M
