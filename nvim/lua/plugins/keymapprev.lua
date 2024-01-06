return {
	{
		"Cassin01/wf.nvim",
		priority = 999,
		config = function()
			-- Which Key
			local groups = {
				["<Space>g"] = "Perform Git operations",
				["<Space>z"] = "Perform Debug operations",
			}
			local which_key = require("wf.builtin.which_key")

			vim.keymap.set(
				"n",
				"<Leader>",
				which_key({ text_insert_in_advance = "<Leader>", key_group_dict = groups }),
				{ noremap = true, silent = true, desc = "/" }
			)
			vim.keymap.set(
				"n",
				"t",
				which_key({ text_insert_in_advance = "t" }),
				{ noremap = true, silent = true, desc = "Perform tests" }
			)
		end,
	},
}
