local wk = require("which-key")

-- keymaps in normal mode
wk.register({
	t = { "<cmd>ToggleTerm<CR>", "toggle terminal", noremap = true },
}, { prefix = "<leader>" })

-- keymaps in terminal mode
wk.register({
	t = { "<cmd>ToggleTerm<CR>", "toggle terminal", noremap = true },
}, { mode = "t", prefix = "<leader>" })

require("toggleterm").setup({
	direction = "float",
})
