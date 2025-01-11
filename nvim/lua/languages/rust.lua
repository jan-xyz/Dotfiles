local M = {}

function M.setup()
	local nvim_lsp = require("lspconfig")
	local completion = require("cmp_nvim_lsp")

	-- LSP config
	nvim_lsp.rust_analyzer.setup({
		cmd = { "/opt/homebrew/bin/rust-analyzer" },
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
					merge = { glob = false },
				},
			},
		},
	})
end

return M
