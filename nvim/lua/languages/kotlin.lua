local M = {}

function M.setup()
	local nvim_lsp = require("lspconfig")
	local completion = require("cmp_nvim_lsp")

	-- Kotlin
	nvim_lsp.kotlin_language_server.setup({
		capabilities = completion.default_capabilities(),
		cmd = { "kotlin-language-server" },
	})
end

return M
