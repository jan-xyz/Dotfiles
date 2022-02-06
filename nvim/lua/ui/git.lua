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
		-- normal mode
		wk.register({
			g = {
				name = "Git",
				b = { "<cmd>lua require('gitsigns').blame_line()<CR>", "Blame", noremap = true },
				d = { "<cmd>lua require('gitsigns').preview_hunk()<CR>", "Diff", noremap = true },
				r = { "<cmd>lua require('gitsigns').reset_hunk()<CR>", "Reset Hunk", noremap = true },
				s = { "<cmd>lua require('gitsigns').stage_hunk()<CR>", "Stage Hunk", noremap = true },
			},
		}, {
			mode = "n",
			prefix = "<leader>",
		})
		-- visual mode
		wk.register({
			g = {
				name = "Git",
				r = {
					"<cmd>lua require('gitsigns').reset_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>",
					"Reset Hunk",
					noremap = true,
				},
				s = {
					"<cmd>lua require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>",
					"Stage Hunk",
					noremap = true,
				},
			},
		}, {
			mode = "v",
			prefix = "<leader>",
		})
	end,
})
