local packer = require("packer")
packer.use({
	"nvim-telescope/telescope.nvim",
	requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }, { "folke/which-key.nvim" } },
	config = function()
		local wk = require("which-key")
		wk.register({
			f = {
				name = "File", -- optional group name
				f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find File", noremap = true },
				g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Find in File", noremap = true },
				o = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Open Recent File", noremap = true },
				r = { "<cmd>lua require('telescope.builtin').resume()<cr>", "Resume last picker", noremap = true },
				p = { "<cmd>lua require('telescope.builtin').pickers()<cr>", "List all pickers", noremap = true },
				b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "List open buffers", noremap = true },
			},
		}, {
			prefix = "<leader>",
		})
	end,
})
