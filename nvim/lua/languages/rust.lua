local lsp = require("lsp")

-- Rust
vim.cmd(
	[[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"ChainingHint"} }]]
)
require("rust-tools").setup({
	server = {
		on_attach = lsp.on_attach,
		settings = {
			["rust-analyzer"] = {
				assist = {
					importGranularity = "item",
					importPrefix = "by_self",
					importEnforceGranularity = true,
				},
			},
		},
	},
})
