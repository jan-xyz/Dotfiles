vim.lsp.config("rust_analyzer", {
	cmd = { "/opt/homebrew/bin/rust-analyzer" },
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	settings = {
		["rust-analyzer"] = {
			checkOnSave = true,
			check = {
				-- use "clippy" instead of "check"
				command = "clippy",
				-- you can pass extra args too, for example:
				-- extraArgs = { "--no-deps" },
			},
			diagnostics = {
				enable = true,
				experimental = {
					enable = true,
				},
			},
		},
	},
})
vim.lsp.enable("rust_analyzer")
