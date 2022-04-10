local packer = require("packer")

packer.use({ "stevearc/dressing.nvim" })

packer.use({
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({ level = "info" })
		vim.notify = require("notify")
	end,
})
