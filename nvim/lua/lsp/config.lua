-- https://github.com/neovim/nvim-lspconfig

local M = {}

-- Global callback functions for LSP shortcuts
function M.on_attach(client, bufnr)
	vim.notify("connecting '" .. client.name .. "' to buffer " .. bufnr, vim.log.levels.DEBUG)
	-- vim.notify(vim.inspect(client.resolved_capabilities), vim.log.levels.DEBUG)

	require("lsp-inlayhints").on_attach(client, bufnr)

	local wk = require("which-key")
	local telescope_builtin = require("telescope.builtin")

	-- Workspace diagnostics
	local normal_mode_keymap = {
		w = {
			function()
				telescope_builtin.diagnostics(require("telescope.themes").get_ivy({}))
			end,
			"Workspace Diagnostics",
			noremap = true,
		},
		l = {
			vim.diagnostic.open_float,
			"Line Diagnostics",
			noremap = true,
		},
	}
	local visual_mode_keymap = {}
	-- Code Lens
	if client.resolved_capabilities.code_lens then
		vim.api.nvim_create_autocmd(
			"CursorHold,CursorHoldI,InsertLeave",
			{ callback = vim.lsp.codelens.refresh, buffer = 0 }
		)
		normal_mode_keymap["c"] = {
			vim.lsp.codelens.run,
			"Codelens",
			noremap = true,
		}
	end
	-- Format document
	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.formatting_sync({}, 500)
			end,
			buffer = 0,
		})
	end
	-- Goto Defintion
	if client.resolved_capabilities.goto_definition then
		wk.register({ d = { telescope_builtin.lsp_definitions, "Definition", noremap = true } }, { prefix = "g" })
	end
	-- Goto Implementations
	if client.resolved_capabilities.implementation then
		wk.register(
			{ i = { telescope_builtin.lsp_implementations, "Implementation", noremap = true } },
			{ prefix = "g" }
		)
	end
	-- Find References
	if client.resolved_capabilities.find_references then
		wk.register({ r = { telescope_builtin.lsp_references, "References", noremap = true } }, { prefix = "g" })
	end
	-- Hover
	if client.resolved_capabilities.hover then
		normal_mode_keymap["h"] = {
			vim.lsp.buf.hover,
			"Hover",
			noremap = true,
		}
	end
	-- Rename
	if client.resolved_capabilities.rename then
		normal_mode_keymap["r"] = {
			vim.lsp.buf.rename,
			"Rename",
			noremap = true,
		}
	end
	-- Code Action
	if client.resolved_capabilities.code_action then
		visual_mode_keymap["a"] = {
			vim.lsp.buf.range_code_action,
			"range code actions",
			noremap = true,
		}
		normal_mode_keymap["a"] = {
			vim.lsp.buf.code_action,
			"code actions",
			noremap = true,
		}
	end
	-- Symbols
	if client.resolved_capabilities.workspace_symbol then
		normal_mode_keymap["#"] = {
			telescope_builtin.lsp_dynamic_workspace_symbols,
			"Seach workspace symbols",
			noremap = true,
		}
	end
	if client.resolved_capabilities.document_symbol then
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
