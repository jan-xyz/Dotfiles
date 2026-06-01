return {
	{
		"akinsho/toggleterm.nvim",
		branch = "main",
		keys = {
			{ "<C-n>", "<cmd>ToggleTerm<CR>", mode = { "n", "t" }, desc = "Focus or toggle Terminal" },
		},
		config = function()
			require("toggleterm").setup({
				shading_factor = 0,
			})
		end,
	},
}
