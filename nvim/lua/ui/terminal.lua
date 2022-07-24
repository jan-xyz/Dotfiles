local packer = require("packer")
packer.use({
	"akinsho/toggleterm.nvim",
	branch = "main",
	requires = { "folke/which-key.nvim" },
	config = function()
		-- configure neovim nesting with neovim-remote
		vim.env.GIT_EDITOR = "nvr -cc split --remote-wait"
		vim.api.nvim_exec([[ autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete ]], false)

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
