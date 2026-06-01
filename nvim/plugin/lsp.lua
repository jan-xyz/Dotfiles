-- See `:h LspAttach`
function On_attach(args)
	local bufnr = args.buf
	local client = vim.lsp.get_client_by_id(args.data.client_id)

	if not client then
		vim.notify("no client found for buffer " .. bufnr, vim.log.levels.DEBUG)
		return
	end

	-- vim.notify("connecting '" .. client.name .. "' to buffer " .. bufnr, vim.log.levels.DEBUG)
	-- vim.notify(vim.inspect(client.server_capabilities), vim.log.levels.DEBUG)

	-- Workspace diagnostics
	vim.keymap.set(
		"n",
		"<leader>d",
		vim.diagnostic.setloclist,
		{ noremap = true, buffer = bufnr, desc = "Open buffer diagnostics" }
	)
	vim.keymap.set(
		"n",
		"<leader>D",
		vim.diagnostic.setqflist,
		{ noremap = true, buffer = bufnr, desc = "Open workspace diagnostics" }
	)

	-- Code Lens
	if client.server_capabilities ~= nil and client.server_capabilities.codeLensProvider then
		vim.lsp.codelens.enable(true, { bufnr = bufnr })
		vim.keymap.set(
			"n",
			"<leader>c",
			vim.lsp.codelens.run,
			{ noremap = true, buffer = bufnr, desc = "Perform codelens" }
		)
	end

	-- Format document
	if client.server_capabilities ~= nil and client.server_capabilities.documentFormattingProvider then
		local format = function()
			vim.lsp.buf.format({
				bufnr = bufnr,
				async = false,
			})
		end
		vim.api.nvim_create_autocmd("BufWritePre", { callback = format, buffer = bufnr })
	end

	-- Symbols
	if client.server_capabilities ~= nil and client.server_capabilities.workspaceSymbolProvider then
		vim.keymap.set(
			"n",
			"<leader>O",
			vim.lsp.buf.workspace_symbol,
			{ noremap = true, buffer = bufnr, desc = "Open workspace symbol picker" }
		)
	end
end

vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/kosayoda/nvim-lightbulb",
	"https://github.com/folke/lazydev.nvim",
	"https://github.com/MysticalDevil/inlay-hints.nvim",
})
require("nvim-lightbulb").setup({ sign = { text = "" }, autocmd = { enabled = true } })
require("inlay-hints").setup()

vim.api.nvim_create_autocmd("LspAttach", {
	callback = On_attach,
})
