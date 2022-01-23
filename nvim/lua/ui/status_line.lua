local packer = require("packer")

packer.use({
	"jan-xyz/nvim-hardline",
	branch = "patch-1",
	config = function()
		require("hardline").setup({
			theme = "nord",
			sections = {
				{ class = "mode", item = require("hardline.parts.mode").get_item },
				{ class = "high", item = require("hardline.parts.git").get_item, hide = 100 },
				{ class = "med", item = require("hardline.parts.filename").get_item },
				"%<",
				{ class = "med", item = "%=" },
				{ class = "low", item = require("hardline.parts.wordcount").get_item, hide = 100 },
				{ class = "error", item = require("hardline.parts.lsp").get_error },
				{ class = "warning", item = require("hardline.parts.lsp").get_warning },
				{ class = "warning", item = require("hardline.parts.whitespace").get_item },
				{ class = "high", item = require("hardline.parts.filetype").get_item, hide = 80 },
				{ class = "high", item = require("hardline.parts.lsp").get_lsp_clients, hide = 80 },
				{ class = "mode", item = require("hardline.parts.line").get_item },
			},
		})
	end,
})
