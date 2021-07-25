local nvim_lsp = require("lspconfig")
local lsp = require("lsp")

nvim_lsp.bashls.setup({
	on_attach = lsp.on_attach,
})

-- LUA
local luadev = require("lua-dev").setup({
	lspconfig = {
		on_attach = lsp.on_attach,
		cmd = { "lua-langserver" },
	},
})
nvim_lsp.sumneko_lua.setup(luadev)

-- EFM (general purpose language server)
nvim_lsp.efm.setup({
	on_attach = lsp.on_attach,
	init_options = { documentFormatting = true },
	filetypes = { "sh", "lua" },
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
		},
	},
})
