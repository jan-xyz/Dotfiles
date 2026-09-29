local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

require("mini.indentscope").setup()

-- static indent guides that follow the indent width of each buffer
local function set_indent_guides()
	local width = vim.bo.shiftwidth > 0 and vim.bo.shiftwidth or vim.bo.tabstop
	vim.opt_local.listchars = "tab:⟶ ,leadmultispace:│" .. string.rep(" ", width - 1)
end

vim.api.nvim_create_autocmd({ "BufWinEnter", "OptionSet" }, {
	group = vim.api.nvim_create_augroup("my.indent_guides", {}),
	pattern = { "*", "shiftwidth", "tabstop" },
	callback = function(args)
		if args.event == "OptionSet" and not vim.tbl_contains({ "shiftwidth", "tabstop" }, args.match) then
			return
		end
		set_indent_guides()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("my.indentscope_off", {}),
	pattern = { "ministarter", "help", "minifiles", "minipick" },
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})
