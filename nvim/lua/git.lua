-- keymaps
local wk = require("which-key")
wk.register({
	g = { "<cmd>Neogit<CR>", "Neogit", noremap = true },
}, {
	mode = "n",
	prefix = "g",
})
