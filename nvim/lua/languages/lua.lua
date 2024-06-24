local M = {}
function M.setup()
	local nvim_lsp = require("lspconfig")
	local completion = require("cmp_nvim_lsp")

	nvim_lsp.lua_ls.setup({
		cmd = { "lua-language-server" },
		capabilities = completion.default_capabilities(),
		settings = {
			Lua = {
				diagnostics = {
					neededFileStatus = {
						["codestyle-check"] = "Any",
					},
					globals = { "describe", "it", "assert", "vim", "hs" },
				},
				hint = {
					enable = true,
				},
				format = {
					enable = true,
					defaultConfig = {
						quote_style = "double",
						indent_style = "tab",
						indent_size = "1",
						table_separator_style = "comma",
						trailing_table_separator = "smart",
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
	})
end

return M
