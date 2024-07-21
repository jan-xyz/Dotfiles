return {
	{
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local telescope_builtin = require("telescope.builtin")

			local function switch_branch()
				telescope_builtin.git_branches()
			end

			local function show_diagnostics()
				telescope_builtin.diagnostics()
			end

			local function set_filetype()
				vim.ui.input({ prompt = "set filetype", relative = "win" }, function(input)
					if not input or input == "" then
						return
					end
					vim.bo.filetype = input
				end)
			end

			require("lualine").setup({
				options = {
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { { "branch", on_click = switch_branch } },
					lualine_c = {},
					lualine_x = {},
					lualine_y = { { "diagnostics", on_click = show_diagnostics } },
					lualine_z = { { "filetype", draw_empty = true, on_click = set_filetype } },
				},
				extensions = { "toggleterm" },
			})
		end,
	},
}
