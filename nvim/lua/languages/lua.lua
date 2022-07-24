local packer = require("packer")

packer.use({
	"folke/lua-dev.nvim",
	config = function()
		local nvim_lsp = require("lspconfig")
		local lsp = require("lsp.config")
		local completion = require("ui.completion")
		local opts = {
			settings = {
				Lua = {
					diagnostics = {
						neededFileStatus = {
							["codestyle-check"] = "Any",
						},
					},
					format = {
						enable = true,
						defaultConfig = {
							quote_style = "double",
							indent_style = "tab",
							indent_size = "1",
							keep_line_after_if_statement = "maxLine:1",
							keep_line_after_do_statement = "maxLine:1",
							keep_line_after_while_statement = "maxLine:1",
							keep_line_after_repeat_statement = "maxLine:1",
							keep_line_after_for_statement = "maxLine:1",
							keep_line_after_local_or_assign_statement = "maxLine:1",
							keep_line_after_function_define_statement = "keepLine:1",
							keep_line_after_expression_statement = "maxLine:1",
						},
					},
				},
			},
		}
		opts = vim.tbl_deep_extend(
			"force",
			require("lua-dev").setup({
				lspconfig = {
					capabilities = completion.capabilities,
					on_attach = lsp.on_attach,
					cmd = { "lua-language-server" },
				},
			}),
			opts
		)
		nvim_lsp.sumneko_lua.setup(opts)
	end,
}) -- LSP server extensions for Lua
