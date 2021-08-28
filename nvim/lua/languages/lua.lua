local nvim_lsp = require("lspconfig")
local lsp = require("lsp.config")

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
