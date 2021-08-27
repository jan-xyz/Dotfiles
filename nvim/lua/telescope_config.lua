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
