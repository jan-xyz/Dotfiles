vim.lsp.config("rust_analyzer", {
	cmd = { "/opt/homebrew/bin/rust-analyzer" },
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
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
vim.lsp.enable("rust_analyzer")
