local packer = require("packer")

packer.use({
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			relculright = true,
			segments = {
				{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
				{ text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
				{
					sign = { name = { ".*" }, maxwidth = 2, colwidth = 1 },
					click = "v:lua.ScSa"
				},
			}
		})
	end,
})
