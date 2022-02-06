local packer = require("packer")
packer.use({
	"TimUntersberger/neogit",
	config = function()
		require("neogit").setup({ disable_commit_confirmation = true })
		local wk = require("which-key")
		local neogit = require("neogit")
		wk.register({
			g = {
				name = "Git",
				n = { neogit.open, "Neogit", noremap = true },
				c = {
					function()
						neogit.open({ "commit" })
					end,
					"Commit",
					noremap = true,
				},
				p = {
					function()
						neogit.open({ "push" })
					end,
					"Push",
					noremap = true,
				},
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
		local gitsigns = require("gitsigns")
		-- normal mode
		wk.register({
			g = {
				name = "Git",
				b = { gitsigns.blame_line, "Blame", noremap = true },
				d = { gitsigns.preview_hunk, "Diff", noremap = true },
				r = { gitsigns.reset_hunk, "Reset Hunk", noremap = true },
				s = { gitsigns.stage_hunk, "Stage Hunk", noremap = true },
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
					function()
						gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end,
					"Reset Hunk",
					noremap = true,
				},
				s = {
					function()
						gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end,
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
