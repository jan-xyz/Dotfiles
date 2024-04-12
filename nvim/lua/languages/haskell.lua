local M = {}

function M.setup()
	local nvim_lsp = require("lspconfig")
	local completion = require("cmp_nvim_lsp")

	-- LSP config
	nvim_lsp.hls.setup({
		capabilities = completion.default_capabilities(),
	})
end

return M
