local packer = require("packer")
packer.use({
	"TimUntersberger/neogit",
	config = function()
		require("neogit").setup({ disable_commit_confirmation = true })
		local wk = require("which-key")
		wk.register({
			g = {
				name = "Git",
				n = { "<cmd>Neogit<CR>", "Neogit", noremap = true },
			},
		}, {
			mode = "n",
			prefix = "<leader>",
		})
	end,
})

packer.use({
	"lewis6991/gitsigns.nvim",
	requires = { "nvim-lua/plenary.nvim" },
	config = function()
		require("gitsigns").setup({
			numhl = true,
			word_diff = true,
			keymaps = {},
		})
		local wk = require("which-key")
		wk.register({
			g = {
				name = "Git",
				b = { "<cmd>Gitsign blame_line<CR>", "Blame", noremap = true },
				d = { "<cmd>Gitsign diffthis<CR>", "Diff", noremap = true },
			},
		}, {
			mode = "n",
			prefix = "<leader>",
		})
	end,
})
