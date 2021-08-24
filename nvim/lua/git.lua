local use = require("packer").use
use({
	"TimUntersberger/neogit",
	config = function()
		require("neogit").setup({ disable_commit_confirmation = true })
	end,
})

-- keymaps
local wk = require("which-key")
wk.register({
	g = {
		name = "git",
		n = { "<cmd>Neogit<CR>", "Neogit", noremap = true },
		b = { "<cmd>Gitsign blame_line<CR>", "blame", noremap = true },
		d = { "<cmd>Gitsign diffthis<CR>", "blame", noremap = true },
	},
}, {
	mode = "n",
	prefix = "<leader>",
})