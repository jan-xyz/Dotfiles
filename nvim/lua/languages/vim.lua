local M = {}

function M.setup()
	local nvim_lsp = require("lspconfig")
	local lsp = require("lsp.config")
	local completion = require("cmp_nvim_lsp")

	nvim_lsp.vimls.setup({
		capabilities = completion.default_capabilities(),
		on_attach = lsp.on_attach,
	})
end

return M
