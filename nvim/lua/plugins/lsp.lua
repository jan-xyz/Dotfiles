-- See `:h LspAttach`
function On_attach(args)
	local bufnr = args.buf
	local client = vim.lsp.get_client_by_id(args.data.client_id)

	if not client then
		vim.notify("no client found for buffer " .. bufnr, vim.log.levels.DEBUG)
		return
	end

	vim.notify("connecting '" .. client.name .. "' to buffer " .. bufnr, vim.log.levels.DEBUG)
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

	-- Symbols
	if client.server_capabilities.workspaceSymbolProvider then
		vim.keymap.set(
			"n",
			"<leader>O",
			vim.lsp.buf.workspace_symbol,
			{ noremap = true, buffer = bufnr, desc = "Open workspace symbol picker" }
		)
	end
end

return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
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
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = On_attach,
			})
		end,
	},
}
