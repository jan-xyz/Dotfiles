-- https://github.com/neovim/nvim-lspconfig

local M = {}

-- Global callback functions for LSP shortcuts
-- @param client
-- @param bufnr number
function M.on_attach(client, bufnr)
	vim.notify("connecting '" .. client.name .. "' to buffer " .. bufnr, vim.log.levels.DEBUG)
	-- vim.notify(vim.inspect(client.server_capabilities), vim.log.levels.DEBUG)

	require("lsp-inlayhints").on_attach(client, bufnr, false)

	local telescope_builtin = require("telescope.builtin")

	-- Workspace diagnostics
	local current_file_diagnostics = function()
		telescope_builtin.diagnostics({ bufnr = 0 })
	end
	vim.keymap.set("n", "<leader>d", current_file_diagnostics, { noremap = true, desc = "Open diagnostics picker" })
	vim.keymap.set("n", "<leader>D", telescope_builtin.diagnostics,
		{ noremap = true, desc = "Open workspace diagnostics picker" })

	-- Code Lens
	if client.server_capabilities.codeLensProvider then
		vim.api.nvim_create_autocmd(
			{ "BufEnter", "CursorHold", "InsertLeave" },
			{ callback = vim.lsp.codelens.refresh, buffer = bufnr }
		)
		vim.keymap.set("n", "<leader>c", vim.lsp.codelens.run, { noremap = true, desc = "Peform codelens" })
	end

	-- Format document
	if client.server_capabilities.documentFormattingProvider then
		local format = function()
			vim.lsp.buf.format({ async = false })
		end
		vim.api.nvim_create_autocmd("BufWritePre", { callback = format, buffer = bufnr })
	end

	-- Goto Defintion
	if client.server_capabilities.definitionProvider then
		vim.keymap.set("n", "gd", telescope_builtin.lsp_implementations, { noremap = true, desc = "Goto definition" })
	end
	-- Goto Implementations
	if client.server_capabilities.implementationProvider then
		vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, { noremap = true, desc = "Goto Implementations" })
	end

	-- Find References
	if client.server_capabilities.referencesProvider then
		vim.keymap.set("n", "gr", telescope_builtin.lsp_references, { noremap = true, desc = "Goto references" })
	end

	-- Hover
	if client.server_capabilities.hoverProvider then
		vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { noremap = true, desc = "Show docs for item under cursor" })
	end

	-- Rename
	if client.server_capabilities.renameProvider then
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { noremap = true, desc = "Rename symbol" })
	end

	-- Code Action
	if client.server_capabilities.codeActionProvider then
		vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, { noremap = true, desc = "Perform code action" })
	end

	-- Symbols
	if client.server_capabilities.workspaceSymbolProvider then
		vim.keymap.set("n", "<leader>S", telescope_builtin.lsp_dynamic_workspace_symbols,
			{ noremap = true, desc = "Open workspace symbol picker" })
	end
	if client.server_capabilities.documentSymbolProvider then
		vim.keymap.set("n", "<leader>s", telescope_builtin.lsp_document_symbols,
			{ noremap = true, desc = "Open symbol picker" })
	end
end

return M
