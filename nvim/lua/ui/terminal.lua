local packer = require("packer")
packer.use({
	"akinsho/toggleterm.nvim",
	config = function()
		local wk = require("which-key")

		require("toggleterm").setup({
			direction = "float",
		})

		-- keymaps in normal mode
		wk.register({
			t = { "<cmd>ToggleTerm<CR>", "Toggle terminal", noremap = true },
		}, {
			prefix = "<leader>",
		})

		-- keymaps in terminal mode
		wk.register({
			t = { "<cmd>ToggleTerm<CR>", "Toggle terminal", noremap = true },
		}, {
			mode = "t",
			prefix = "<leader>",
		})
	end,
})
