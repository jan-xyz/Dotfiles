local packer = require("packer")

-- preview colors
packer.use({
	"NvChad/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({})
	end,
})

-- rename and other input boxes
packer.use({
	"stevearc/dressing.nvim",
	config = function()
		require("dressing").setup({
			input = {
				win_options = {
					sidescrolloff = 4,
				},
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

-- setup session management
packer.use({
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/" },
			auto_session_use_git_branch = true,
			bypass_session_save_file_types = {},
			pre_save_cmds = {},
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
