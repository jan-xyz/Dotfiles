local packer = require("packer")

-- rename and other input boxes
packer.use({ "stevearc/dressing.nvim" })

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
		})
	end,
})

-- changing the default notification boxes
packer.use({
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			level = "info",
		})
	end,
})
