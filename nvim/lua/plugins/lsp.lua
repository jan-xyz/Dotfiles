-- See `:h LspAttach`
function on_attach(args)
	local bufnr = args.buf
	local client = vim.lsp.get_client_by_id(args.data.client_id)

	if not client then
		vim.notify("no client found for buffer " .. bufnr, vim.log.levels.DEBUG)
		return
	end

	vim.notify("connecting '" .. client.name .. "' to buffer " .. bufnr, vim.log.levels.DEBUG)
	-- vim.notify(vim.inspect(client.server_capabilities), vim.log.levels.DEBUG)

	local telescope_builtin = require("telescope.builtin")

	-- Workspace diagnostics
	local current_file_diagnostics = function()
		telescope_builtin.diagnostics({ bufnr = 0 })
	end
	vim.keymap.set(
		"n",
		"<leader>d",
		current_file_diagnostics,
		{ noremap = true, buffer = bufnr, desc = "Open diagnostics picker" }
	)
	vim.keymap.set(
		"n",
		"<leader>D",
		telescope_builtin.diagnostics,
		{ noremap = true, buffer = bufnr, desc = "Open workspace diagnostics picker" }
	)

	-- Code Lens
	if client.server_capabilities.codeLensProvider then
		vim.api.nvim_create_autocmd(
			{ "BufEnter", "CursorHold", "InsertLeave" },
			{ callback = vim.lsp.codelens.refresh, buffer = bufnr }
		)
		vim.keymap.set(
			"n",
			"<leader>c",
			vim.lsp.codelens.run,
			{ noremap = true, buffer = bufnr, desc = "Peform codelens" }
		)
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
		vim.keymap.set(
			"n",
			"gd",
			telescope_builtin.lsp_definitions,
			{ noremap = true, buffer = bufnr, desc = "Goto definition" }
		)
	end
	-- Goto Implementations
	if client.server_capabilities.implementationProvider then
		vim.keymap.set(
			"n",
			"gi",
			telescope_builtin.lsp_implementations,
			{ noremap = true, buffer = bufnr, desc = "Goto Implementations" }
		)
	end

	-- Find References
	if client.server_capabilities.referencesProvider then
		vim.keymap.set(
			"n",
			"gr",
			telescope_builtin.lsp_references,
			{ noremap = true, buffer = bufnr, desc = "Goto references" }
		)
	end

	-- Hover
	if client.server_capabilities.hoverProvider then
		vim.keymap.set(
			"n",
			"<leader>k",
			vim.lsp.buf.hover,
			{ noremap = true, buffer = bufnr, desc = "Show docs for item under cursor" }
		)
	end

	-- Rename
	if client.server_capabilities.renameProvider then
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { noremap = true, buffer = bufnr, desc = "Rename symbol" })
		vim.keymap.set(
			"n",
			"<leader>R",
			require("lsp-preview").rename_preview,
			{ noremap = true, buffer = bufnr, desc = "Rename symbol" }
		)
	end

	-- Code Action
	if client.server_capabilities.codeActionProvider then
		vim.keymap.set(
			{ "n", "v" },
			"<leader>a",
			vim.lsp.buf.code_action,
			{ noremap = true, buffer = bufnr, desc = "Perform code action" }
		)
		vim.keymap.set(
			{ "n", "v" },
			"<leader>A",
			require("lsp-preview").code_action_preview,
			{ noremap = true, buffer = bufnr, desc = "Perform code action (preview changes)" }
		)
	end

	-- Symbols
	if client.server_capabilities.workspaceSymbolProvider then
		vim.keymap.set(
			"n",
			"<leader>S",
			telescope_builtin.lsp_dynamic_workspace_symbols,
			{ noremap = true, buffer = bufnr, desc = "Open workspace symbol picker" }
		)
	end
	if client.server_capabilities.documentSymbolProvider then
		vim.keymap.set(
			"n",
			"<leader>s",
			telescope_builtin.lsp_document_symbols,
			{ noremap = true, buffer = bufnr, desc = "Open symbol picker" }
		)
	end
end

return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			{
				"jan-xyz/lsp-preview.nvim",
				version = "*",
				opts = {
					apply = false,
					diff = { ctxlen = 20 },
				},
				dependencies = {
					"nvim-telescope/telescope.nvim",
					"nvim-lua/plenary.nvim",
					{
						"echasnovski/mini.diff",
						config = function()
							require("mini.diff").setup({ source = require("mini.diff").gen_source.none() })
						end,
					},
				},
			},
			{ "kosayoda/nvim-lightbulb", opts = { sign = { text = "" }, autocmd = { enabled = true } } },
			{
				"MysticalDevil/inlay-hints.nvim",
				event = "LspAttach",
				dependencies = { "neovim/nvim-lspconfig" },
				config = function()
					require("inlay-hints").setup()
				end,
			},

			-- Language dependencies
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "luvit-meta/library", words = { "vim%.uv" } },
					},
				},
			},
			{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = on_attach,
			})
		end,
	},
}
