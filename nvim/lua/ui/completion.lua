local packer = require("packer")

local M = {}

packer.use({
	"hrsh7th/nvim-cmp",
	requires = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "vsnip" },
			}, {
				{ name = "buffer" },
			}),
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			},
		})
	end,
})

M.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

return M
