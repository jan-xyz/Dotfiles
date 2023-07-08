local M = {}

function M.setup()
	local nvim_lsp = require("lspconfig")
	local lsp = require("lsp.config")
	local completion = require("cmp_nvim_lsp")

	-- Docker
	nvim_lsp.dockerls.setup({
		capabilities = completion.capabilities,
		on_attach = lsp.on_attach,
	})
end

return M
