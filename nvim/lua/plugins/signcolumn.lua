return {
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				relculright = true,
				segments = {
					{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
					{ text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
					{ sign = { text = { "" }, maxwidth = 1, colwidth = 1 } }, -- Support for kosayoda/nvim-lightbulb which somhow doesn't match the below
					{ sign = { name = { ".*" }, maxwidth = 2, colwidth = 1 }, click = "v:lua.ScSa" },
				},
			})
		end,
	},
}
