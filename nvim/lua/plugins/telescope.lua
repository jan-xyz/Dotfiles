return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"folke/which-key.nvim",
			"nvim-lua/plenary.nvim",

			-- Plugins
			"nvim-telescope/telescope-file-browser.nvim",
			"otavioschwanck/telescope-alternate",
		},
		config = function()
			require("telescope").setup({
				pickers = {
					diagnostics = {
						theme = "ivy",
					},
				},
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--hidden",
						"--smart-case",
					},
					file_ignore_patterns = {
						"%.git/.*",
						"%.vim/.*",
						"node_modules/.*",
						"%.idea/.*",
						"%.vscode/.*",
						"%.history/.*",
					},
				},
				extensions = {
					file_browser = {
						-- theme = "ivy",
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						git_status = true,
						hidden = true,
					},
					["telescope-alternate"] = {
						mappings = {
							{ "(.*).go", { { "[1]_test.go", "Test", true } } },
							{ "(.*)_test.go", { { "[1].go", "Original", true } } },
						},
					},
				},
			})

			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("telescope-alternate")

			local wk = require("which-key")
			local telescope_builtin = require("telescope.builtin")

			local file_browser = function()
				require("telescope").extensions.file_browser.file_browser({})
			end

			local current_file = function()
				require("telescope").extensions.file_browser.file_browser({ path = "%:p:h" })
			end

			local find_file = function()
				telescope_builtin.find_files({ hidden = true })
			end

			local alternate = function()
				require("telescope-alternate.telescope").alternate({})
			end

			wk.register({
				f = {
					name = "File", -- optional group name
					f = { find_file, "Find File", noremap = true },
					g = { telescope_builtin.live_grep, "Find in File", noremap = true },
					o = {
						function()
							telescope_builtin.oldfiles({ cwd_only = true })
						end,
						"Open Recent File",
						noremap = true,
					},
					r = { telescope_builtin.resume, "Resume last picker", noremap = true },
					p = { telescope_builtin.pickers, "List all pickers", noremap = true },
					b = { telescope_builtin.buffers, "List open buffers", noremap = true },
				},
			}, {
				prefix = "<leader>",
			})
			wk.register({
				e = { file_browser, "File explorer", noremap = true },
				f = { current_file, "Current file in file explorer", noremap = true },
				t = { alternate, "Alternate Test/File", noremap = true },
			}, {
				prefix = "f",
			})
		end,
	},
}
