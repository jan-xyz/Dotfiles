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
							{ "(.*).go",      { { "[1]_test.go", "Test", true } } },
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

			local recent_files = function()
				telescope_builtin.oldfiles({ cwd_only = true })
			end

			-- inspired by helix mapping: https://docs.helix-editor.com/keymap.html#space-mode
			wk.register({
				f = { find_file, "Open File Picker", noremap = true },
				e = { file_browser, "Toggle or focus explorer", noremap = true },
				E = { current_file, "Focus current file in explorer", noremap = true },
				b = { telescope_builtin.buffers, "Open buffer picker", noremap = true },
				j = { telescope_builtin.jumplist, "Open jumplist picker", noremap = true },
				["'"] = { telescope_builtin.resume, "Resume last picker", noremap = true },
				["/"] = { telescope_builtin.live_grep, "Global search in workspace folder", noremap = true },

				-- additional pickers
				o = { recent_files, "Open Recent File picker", noremap = true },
			}, {
				prefix = "<leader>",
			})
			wk.register({
				a = { alternate, "Go to alternate file", noremap = true },
			}, {
				prefix = "g",
			})
		end,
	},
}
