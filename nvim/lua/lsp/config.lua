-- https://github.com/neovim/nvim-lspconfig

local M = {}

-- Global callback functions for LSP shortcuts
function M.on_attach(client, bufnr)
	require("completion").on_attach()
	local wk = require("which-key")

	--Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	print("client:" .. client.name .. "; bufnr:" .. bufnr)
	-- print(vim.inspect(client.resolved_capabilities))

	local normal_mode_keymap = {
		d = { "<cmd>Telescope lsp_workspace_diagnostics<CR>", "Diagnostics", noremap = true },
	}
	local visual_mode_keymap = {}
	if client.resolved_capabilities.code_lens then
		vim.cmd([[autocmd CursorHold,CursorHoldI,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]])
		normal_mode_keymap["c"] = {
			"<Cmd>lua vim.lsp.codelens.run()<CR>",
			"Codelens",
			noremap = true,
		}
	end

	if client.resolved_capabilities.document_formatting then
		vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 500)]])
	end
	if client.resolved_capabilities.goto_definition then
		wk.register({ d = { "<cmd>Telescope lsp_definitions<CR>", "Definition", noremap = true } }, { prefix = "g" })
	end
	if client.resolved_capabilities.find_references then
		wk.register({ r = { "<cmd>Telescope lsp_references<CR>", "References", noremap = true } }, { prefix = "g" })
	end
	if client.resolved_capabilities.hover then
		normal_mode_keymap["h"] = {
			"<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>",
			"Hover",
			noremap = true,
		}
	end
	if client.resolved_capabilities.rename then
		normal_mode_keymap["r"] = {
			"<cmd>lua require('lspsaga.rename').rename()<CR>",
			"Rename",
			noremap = true,
		}
	end
	if client.resolved_capabilities.code_action then
		visual_mode_keymap["a"] = {
			":'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>",
			"range code actions",
			noremap = true,
		}
		normal_mode_keymap["a"] = {
			"<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
			"Code actions",
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
	wk.register(normal_mode_keymap, { prefix = "l" })
	wk.register(visual_mode_keymap, { mode = "v", prefix = "l" })
end

return M
