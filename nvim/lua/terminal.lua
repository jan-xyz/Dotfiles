local wk = require("which-key")

-- keymaps in normal mode
wk.register({
	t = { "<cmd>FloatermToggle<CR>", "toggle terminal", noremap = true },
}, { prefix = "<leader>" })

-- keymaps in terminal mode
wk.register({
	t = { "<cmd>FloatermToggle<CR>", "toggle terminal", noremap = true },
}, { mode = "t", prefix = "<leader>" })
