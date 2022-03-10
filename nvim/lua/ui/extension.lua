local packer = require("packer")

packer.use({ "stevearc/dressing.nvim" })

packer.use({
	"rcarriga/nvim-notify",
	config = function()
		vim.notify = require("notify")
	end,
})
