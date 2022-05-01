local packer = require("packer")

-- LSP load progress
packer.use({
	"j-hui/fidget.nvim",
	config = function()
		require("fidget").setup({})
	end,
})

-- rename and other input boxes
packer.use({ "stevearc/dressing.nvim" })

-- changing the default notification boxes
packer.use({
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({ level = "info" })
		vim.notify = require("notify")
	end,
})
