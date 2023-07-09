local M = {}

function M.setup()
	local nvim_lsp = require("lspconfig")
	local lsp = require("lsp.config")
	local completion = require("cmp_nvim_lsp")

	nvim_lsp.sourcekit.setup({
		capabilities = completion.default_capabilities(),
		on_attach = lsp.on_attach,
		cmd = { "xcrun", "sourcekit-lsp" },
	})
end

return M
