local M = {}

function M.setup()
	local nvim_lsp = require("lspconfig")
	local lsp = require("lsp.config")
	local completion = require("cmp_nvim_lsp")

	-- LSP config
	nvim_lsp.bufls.setup({
		capabilities = completion.default_capabilities(),
		on_attach = lsp.on_attach,
		settings = {},
	})
end

return M
