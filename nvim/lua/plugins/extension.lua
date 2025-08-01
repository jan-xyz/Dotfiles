return {
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("colorizer").setup({})
		end,
	},

	-- Add indentation guides even on blank lines
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
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
		event = { "BufReadPost", "BufNewFile" },
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
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local devicons = require("nvim-web-devicons")
			local utils = require("telescope.utils")
			require("incline").setup({
				render = function(props)
					local fname = vim.api.nvim_buf_get_name(props.buf)

					-- filename
					local filename = vim.fn.fnamemodify(fname, ":t")
					if filename == "" then
						filename = "[No Name]"
					end

					-- directory
					local dirname = vim.fn.fnamemodify(fname, ":h")
					local shortdir, _ =
						utils.transform_path({ path_display = { shorten = { len = 1, exclude = { 1, -1 } } } }, dirname)

					-- icon
					local ft_icon, ft_color = devicons.get_icon_color(filename)

					-- modified
					local modified = vim.bo[props.buf].modified

					return {
						ft_icon and { " ", ft_icon, " ", guifg = ft_color } or "",
						" ",
						{ filename },
						" ",
						{ shortdir, group = "Comment" },
						" ",
						modified and { "●", group = "DiagnosticWarn" } or "",
						" ",
						group = "Normal",
					}
				end,
			})
		end,
	},
	-- modern take on `vim.ui.select` and `vim.ui.input`
	{
		"stevearc/dressing.nvim",
		config = function()
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
		end,
	},

	-- setup (un-)commenting lines and selection
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("Comment").setup()
		end,
	},
}
