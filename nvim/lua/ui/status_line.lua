local packer = require("packer")

packer.use({
	"ojroques/nvim-hardline",
	config = function()
		local function get_lsp_clients()
			local clients = vim.lsp.buf_get_clients()
			if next(clients) == nil then
				return ""
			end

			local c = {}
			for _, client in ipairs(clients) do
				table.insert(c, client.name)
			end
			return table.concat(c, "|")
		end

		require("hardline").setup({
			theme = "nord",
			sections = { -- define sections
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
				{ class = "high", item = get_lsp_clients, hide = 80 },
				{ class = "mode", item = require("hardline.parts.line").get_item },
			},
		})
	end,
})
