local packer = require("packer")

packer.use({
	"vim-test/vim-test",
	config = function()
		local wk = require("which-key")
		wk.register({
			name = "Run Tests",
			n = { "<cmd>TestNearest<CR>", "Nearest", noremap = true },
			f = { "<cmd>TestFile<CR>", "All in file", noremap = true },
			s = { "<cmd>TestSuite<CR>", "Full suite", noremap = true },
			l = { "<cmd>TestLast<CR>", "Last", noremap = true },
		}, {
			prefix = "t",
		})

		local tt = require("toggleterm")
		local ttt = require("toggleterm.terminal")

		vim.g["test#custom_strategies"] = {
			tterm = function(cmd)
				tt.exec(cmd)
			end,

			tterm_close = function(cmd)
				local term_id = 0
				tt.exec(cmd, term_id)
				ttt.get_or_create_term(term_id):close()
			end,
		}

		vim.g["test#strategy"] = "tterm"
	end,
})
