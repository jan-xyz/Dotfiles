return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"arkav/lualine-lsp-progress",
		},
		config = function()
			local telescope_builtin = require("telescope.builtin")

			local function copy_path_to_clipboard()
				local filename = vim.fn.getreg("%")
				vim.fn.setreg("*", filename)
				vim.notify("copied filename to system clipboard", vim.log.levels.INFO)
			end

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
					lualine_b = { { "filename", path = 1, on_click = copy_path_to_clipboard } },
					lualine_c = { { "branch", on_click = switch_branch } },
					lualine_x = { "lsp_progress" },
					lualine_y = { { "diagnostics", on_click = show_diagnostics } },
					lualine_z = { { "filetype", draw_empty = true, on_click = set_filetype } },
				},
				extensions = { "toggleterm" },
			})
		end,
	},
}
