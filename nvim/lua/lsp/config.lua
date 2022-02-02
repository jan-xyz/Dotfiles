-- https://github.com/neovim/nvim-lspconfig

local M = {}

-- Global callback functions for LSP shortcuts
function M.on_attach(client, bufnr)
	print("client:" .. client.name .. "; bufnr:" .. bufnr)
	-- print(vim.inspect(client.resolved_capabilities))

	local wk = require("which-key")

	-- Workspace diagnostics
	local normal_mode_keymap = {
		w = {
			"<cmd>lua require'telescope.builtin'.diagnostics(require('telescope.themes').get_ivy({}))<cr>",
			"Workspace Diagnostics",
			noremap = true,
		},
		l = {
			"<cmd>lua vim.diagnostic.open_float()<cr>",
			"Line Diagnostics",
			noremap = true,
		},
	}
	local visual_mode_keymap = {}
	-- Code Lens
	if client.resolved_capabilities.code_lens then
		vim.cmd([[autocmd CursorHold,CursorHoldI,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]])
		normal_mode_keymap["c"] = {
			"<Cmd>lua vim.lsp.codelens.run()<CR>",
			"Codelens",
			noremap = true,
		}
	end
	-- Format document
	if client.resolved_capabilities.document_formatting then
		vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 500)]])
	end
	-- Goto Defintion
	if client.resolved_capabilities.goto_definition then
		wk.register({ d = { "<cmd>Telescope lsp_definitions<CR>", "Definition", noremap = true } }, { prefix = "g" })
	end
	-- Goto Implementations
	if client.resolved_capabilities.implementation then
		wk.register(
			{ i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation", noremap = true } },
			{ prefix = "g" }
		)
	end
	-- Find References
	if client.resolved_capabilities.find_references then
		wk.register({
			r = {
				"<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_ivy({}))<cr>",
				"References",
				noremap = true,
			},
		}, {
			prefix = "g",
		})
	end
	-- Hover
	if client.resolved_capabilities.hover then
		normal_mode_keymap["h"] = {
			"<cmd>lua vim.lsp.buf.hover()<CR>",
			"Hover",
			noremap = true,
		}
	end
	-- Rename
	if client.resolved_capabilities.rename then
		normal_mode_keymap["r"] = {
			"<cmd>lua vim.lsp.buf.rename()<CR>",
			"Rename",
			noremap = true,
		}
	end
	-- Code Action
	if client.resolved_capabilities.code_action then
		visual_mode_keymap["a"] = {
			":'<,'>Telescope lsp_range_code_actions<CR>",
			"range code actions",
			noremap = true,
		}
		normal_mode_keymap["a"] = {
			"<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({}))<CR>",
			"code actions",
			noremap = true,
		}
	end
	-- Symbols
	if client.resolved_capabilities.workspace_symbol then
		normal_mode_keymap["#"] = {
			"<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>",
			"Seach workspace symbols",
			noremap = true,
		}
	end
	if client.resolved_capabilities.document_symbol then
		normal_mode_keymap["s"] = {
			"<cmd>Vista!!<CR>",
			"Symbols",
			noremap = true,
		}
	end
	wk.register(normal_mode_keymap, { prefix = "<leader>" })
	wk.register(visual_mode_keymap, { mode = "v", prefix = "<leader>" })
end

return M
