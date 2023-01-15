-- https://github.com/neovim/nvim-lspconfig

local M = {}

-- Global callback functions for LSP shortcuts
-- @param client
-- @param bufnr number
function M.on_attach(client, bufnr)
	vim.notify("connecting '" .. client.name .. "' to buffer " .. bufnr, vim.log.levels.DEBUG)
	--vim.notify(vim.inspect(client.server_capabilities), vim.log.levels.DEBUG)

	require("lsp-inlayhints").on_attach(client, bufnr, false)

	local wk = require("which-key")
	local telescope_builtin = require("telescope.builtin")

	-- Workspace diagnostics
	local normal_mode_keymap = {
		w = { telescope_builtin.diagnostics, "Workspace Diagnostics", noremap = true },
		l = { vim.diagnostic.open_float, "Line Diagnostics", noremap = true },
	}
	local visual_mode_keymap = {}
	-- Code Lens
	if client.server_capabilities.codeLensProvider then
		vim.api.nvim_create_autocmd(
			"CursorHold,CursorHoldI,InsertLeave",
			{ callback = vim.lsp.codelens.refresh, buffer = 0 }
		)
		normal_mode_keymap["c"] = { vim.lsp.codelens.run, "Codelens", noremap = true }
	end
	-- Format document
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd(
			"BufWritePre",
			{ callback = vim.lsp.buf.format, buffer = 0 }
		)
	end
	-- Goto Defintion
	if client.server_capabilities.definitionProvider then
		wk.register({ d = { telescope_builtin.lsp_definitions, "Definition", noremap = true } }, { prefix = "g" })
	end
	-- Goto Implementations
	if client.server_capabilities.implementationProvider then
		wk.register(
			{ i = { telescope_builtin.lsp_implementations, "Implementation", noremap = true } },
			{ prefix = "g" }
		)
	end
	-- Find References
	if client.server_capabilities.referencesProvider then
		wk.register({ r = { telescope_builtin.lsp_references, "References", noremap = true } }, { prefix = "g" })
	end
	-- Hover
	if client.server_capabilities.hoverProvider then
		normal_mode_keymap["h"] = {
			vim.lsp.buf.hover,
			"Hover",
			noremap = true,
		}
	end
	-- Rename
	if client.server_capabilities.renameProvider then
		normal_mode_keymap["r"] = {
			vim.lsp.buf.rename,
			"Rename",
			noremap = true,
		}
	end
	-- Code Action
	if client.server_capabilities.codeActionProvider then
		visual_mode_keymap["a"] = {
			vim.lsp.buf.code_action,
			"code actions",
			noremap = true,
		}
		normal_mode_keymap["a"] = {
			vim.lsp.buf.code_action,
			"code actions",
			noremap = true,
		}
	end
	-- Symbols
	if client.server_capabilities.workspaceSymbolProvider then
		normal_mode_keymap["#"] = {
			telescope_builtin.lsp_dynamic_workspace_symbols,
			"Seach workspace symbols",
			noremap = true,
		}
	end
	if client.server_capabilities.documentSymbolProvider then
		normal_mode_keymap["s"] = {
			telescope_builtin.lsp_document_symbols,
			"Symbols",
			noremap = true,
		}
	end
	wk.register(normal_mode_keymap, { prefix = "<leader>" })
	wk.register(visual_mode_keymap, { mode = "v", prefix = "<leader>" })
end

return M
