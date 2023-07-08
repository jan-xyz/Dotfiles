local packer = require("packer")

-- preview colors
packer.use({
	"NvChad/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({})
	end,
})

-- moden take on `vim.ui.select` and `vim.ui.input`
packer.use({
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
})

-- setup (un-)commenting lines and selection
packer.use({
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
	end,
})

-- setup surround text objects
packer.use({
	"kylechui/nvim-surround",
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
})

-- setup register management
packer.use({
	"AckslD/nvim-neoclip.lua",
	requires = { "nvim-telescope/telescope.nvim", "folke/which-key.nvim" },
	config = function()
		require("neoclip").setup()
		-- keymap
		local wk = require("which-key")
		wk.register({
			p = {
				name = "registers", -- optional group name
				p = { require("telescope").extensions.neoclip.default, "pick register", noremap = true },
			},
		}, {
			mode = "n",
			prefix = "<leader>",
		})
	end,
})

-- changing the default notification boxes
packer.use({
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			level = "info",
		})
		vim.notify = notify
	end,
})
