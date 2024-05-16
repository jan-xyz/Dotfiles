return {
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({})
		end,
	},

	-- Add indentation guides even on blank lines
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			scope = {
				highlight = "Keyword",
			},
			exclude = {
				filetypes = {
					"dashboard",
				},
			},
		},
	},

	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
	-- show the keys being pressed in a popup window
	{
		"NStefan002/screenkey.nvim",
		cmd = "Screenkey",
		version = "*",
		config = true,
	},
	-- alternative window bar
	{
		"b0o/incline.nvim",
		config = function()
			require("incline").setup()
		end,
		event = "VeryLazy",
	},
	-- modern take on `vim.ui.select` and `vim.ui.input`
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({
				input = {
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
		end,
	},

	-- setup (un-)commenting lines and selection
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- changing the default notification boxes
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")
			notify.setup({
				level = "info",
			})
			vim.notify = notify
		end,
	},
}
