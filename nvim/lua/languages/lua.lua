local packer = require("packer")

packer.use({
	"folke/lua-dev.nvim",
	config = function()
		local nvim_lsp = require("lspconfig")
		local lsp = require("lsp.config")
		local completion = require("ui.completion")
		local luadev = require("lua-dev").setup({
			lspconfig = {
				capabilities = completion.capabilities,
				on_attach = lsp.on_attach,
				cmd = { "lua-language-server" },
			},
		})
		nvim_lsp.sumneko_lua.setup(luadev)
	end,
}) -- LSP server extensions for Lua
