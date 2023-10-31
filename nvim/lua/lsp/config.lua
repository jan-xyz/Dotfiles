-- https://github.com/neovim/nvim-lspconfig

local M = {}

-- Global callback functions for LSP shortcuts
-- @param client
-- @param bufnr number
function M.on_attach(client, bufnr)
	vim.notify("connecting '" .. client.name .. "' to buffer " .. bufnr, vim.log.levels.DEBUG)
	-- vim.notify(vim.inspect(client.server_capabilities), vim.log.levels.DEBUG)

	require("lsp-inlayhints").on_attach(client, bufnr, false)

	local wk = require("which-key")
	local telescope_builtin = require("telescope.builtin")

	-- Workspace diagnostics
	local current_file_diagnostics = function()
		telescope_builtin.diagnostics({ bufnr = 0 })
	end
	wk.register(
		{
			d = { current_file_diagnostics, "Open diagnostics picker", noremap = true },
			D = { telescope_builtin.diagnostics, "Open workspace diagnostics picker", noremap = true },
		},
		{ prefix = "<leader>" }
	)

	-- Code Lens
	if client.server_capabilities.codeLensProvider then
		vim.api.nvim_create_autocmd(
			{ "BufEnter", "CursorHold", "InsertLeave" },
			{ callback = vim.lsp.codelens.refresh, buffer = bufnr }
		)
		wk.register(
			{ c = { vim.lsp.codelens.run, "Codelens", noremap = true } },
			{ prefix = "<leader>" }
		)
	end

	-- Format document
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
			buffer = bufnr,
		})
	end

	-- Goto Defintion
	if client.server_capabilities.definitionProvider then
		wk.register(
			{ d = { telescope_builtin.lsp_definitions, "Goto Definition", noremap = true } },
			{ prefix = "g" }
		)
	end
	-- Goto Implementations
	if client.server_capabilities.implementationProvider then
		wk.register(
			{ i = { telescope_builtin.lsp_implementations, "Goto Implementation", noremap = true } },
			{ prefix = "g" }
		)
	end

	-- Find References
	if client.server_capabilities.referencesProvider then
		wk.register(
			{ r = { telescope_builtin.lsp_references, "Goto References", noremap = true } },
			{ prefix = "g" }
		)
	end

	-- Hover
	if client.server_capabilities.hoverProvider then
		wk.register(
			{ k = { vim.lsp.buf.hover, "Show docs for item under cursor", noremap = true } },
			{ prefix = "<leader>" }
		)
	end

	-- Rename
	if client.server_capabilities.renameProvider then
		wk.register(
			{ r = { vim.lsp.buf.rename, "Rename symbol", noremap = true } },
			{ prefix = "<leader>" }
		)
	end

	-- Code Action
	if client.server_capabilities.codeActionProvider then
		wk.register(
			{ a = { vim.lsp.buf.code_action, "Preform code action", noremap = true } },
			{ prefix = "<leader>" }
		)
		wk.register(
			{ a = { vim.lsp.buf.code_action, "Preform code action", noremap = true } },
			{ prefix = "<leader>", mode = "v" }
		)
	end

	-- Symbols
	if client.server_capabilities.workspaceSymbolProvider then
		wk.register(
			{ S = { telescope_builtin.lsp_dynamic_workspace_symbols, "Open workspace symbol picker", noremap = true } },
			{ prefix = "<leader>" }
		)
	end
	if client.server_capabilities.documentSymbolProvider then
		wk.register(
			{ s = { telescope_builtin.lsp_document_symbols, "Open symbol picker", noremap = true } },
			{ prefix = "<leader>" }
		)
	end
end

return M
