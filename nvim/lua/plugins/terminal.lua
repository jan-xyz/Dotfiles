return {
	{
		"akinsho/toggleterm.nvim",
		branch = "main",
		dependencies = { "folke/which-key.nvim" },
		config = function()
			require("toggleterm").setup({
				direction = "float",
			})

			vim.keymap.set({ "n", "t" }, "<C-n>", "<cmd>ToggleTerm<CR>",
				{ noremap = true, desc = "Focus or toggle Terminal" })
		end,
	},
}
