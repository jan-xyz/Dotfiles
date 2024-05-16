return {
	{
		"luukvbaal/statuscol.nvim",
		branch = "0.10",
		config = function()
			-- custom config
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
		end,
	},
}
