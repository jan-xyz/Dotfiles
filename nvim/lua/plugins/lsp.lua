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
				callback = require("lsp.config").on_attach,
			})
			require("languages.ansible").setup()
			require("languages.bash").setup()
			require("languages.cpp").setup()
			require("languages.dart").setup()
			require("languages.docker").setup()
			require("languages.go").setup()
			require("languages.haskell").setup()
			require("languages.jsonnet").setup()
			require("languages.julia").setup()
			require("languages.kotlin").setup()
			require("languages.lua").setup()
			require("languages.proto").setup()
			require("languages.python").setup()
			require("languages.r").setup()
			require("languages.rust").setup()
			require("languages.scala").setup()
			require("languages.swift").setup()
			require("languages.ts").setup()
			require("languages.vim").setup()
			require("languages.yaml").setup()
		end,
	},
}
