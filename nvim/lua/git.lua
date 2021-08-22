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
	g = { "<cmd>Neogit<CR>", "Neogit", noremap = true },
}, {
	mode = "n",
	prefix = "<leader>",
})
