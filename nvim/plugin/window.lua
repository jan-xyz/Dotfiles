vim.pack.add({
	"https://github.com/dstein64/nvim-scrollview",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/luukvbaal/statuscol.nvim",
	"https://github.com/stevearc/dressing.nvim",
})
require("scrollview").setup({})

local builtin = require("statuscol.builtin")
local relnumfunc = function(args, fa)
	args.rnu = true
	return builtin.lnumfunc(args, fa)
end

-- setup
require("statuscol").setup({
	segments = {
		-- fold column
		{ text = { builtin.foldfunc },                                             click = "v:lua.ScFa" },
		-- number column
		{ text = { relnumfunc },                                                   click = "v:lua.ScLa" },
		-- anything else
		{ sign = { name = { ".*" }, text = { ".*" }, maxwidth = 2, colwidth = 1 }, click = "v:lua.ScSa" },
	},
})

require("dressing").setup({
	input = {
		start_in_insert = false,
		win_options = {
			sidescrolloff = 4,
		},
		-- make it possible to override options for `input` from the call side
		get_config = function(extra_opts)
			local opts = require("dressing.config").input
			return vim.tbl_deep_extend("force", opts, extra_opts or {})
		end,
	},
	select = {
		-- make it possible to override options for `select` from the call side
		get_config = function(extra_opts)
			local opts = require("dressing.config").select
			return vim.tbl_deep_extend("force", opts, extra_opts or {})
		end,
	},
})
