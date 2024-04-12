local M = {}

function M.setup()
	local nvim_lsp = require("lspconfig")
	local completion = require("cmp_nvim_lsp")

	nvim_lsp.vimls.setup({
		capabilities = completion.default_capabilities(),
	})
end

return M
