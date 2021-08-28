local packer = require("packer")
packer.use({
	"nvim-telescope/telescope.nvim",
	requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }, { "folke/which-key.nvim" } },
	config = function()
		local wk = require("which-key")
		wk.register({
			f = {
				name = "File", -- optional group name
				f = { "<cmd>Telescope find_files<cr>", "Find File", noremap = true },
				g = { "<cmd>Telescope live_grep<cr>", "Find in File", noremap = true },
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = true },
			},
		}, {
			prefix = "<leader>",
		})
	end,
})
