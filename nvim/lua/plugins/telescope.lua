-- this auto command and the local function work together
-- to format and color a path output in Telescope.
-- See: https://github.com/nvim-telescope/telescope.nvim/issues/2014#issuecomment-1873229658
vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	callback = function(ctx)
		vim.api.nvim_buf_call(ctx.buf, function()
			vim.fn.matchadd("TelescopeParent", "\t\t.*$")
			vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
		end)
	end,
})

local function filenameFirst(_, path)
	local tail = vim.fs.basename(path)
	local parent = vim.fs.dirname(path)
	if parent == "." then
		return tail
	end
	return string.format("%s\t\t%s", tail, parent)
end

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
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
						path_display = filenameFirst,
						line_width = "full",
					},
					find_files = {
						path_display = filenameFirst,
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
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						git_status = true,
						hidden = true,
					},
					["telescope-alternate"] = {
						mappings = {
							{ "(.*).go", { { "[1]_test.go", "Test", function()
								return not string.match(vim.api.nvim_buf_get_name(0), ".*_test.go")
							end } } },
							{ "(.*)_test.go", { { "[1].go", "Original", true } } },
						},
					},
				},
			})

			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("telescope-alternate")

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
			vim.keymap.set("n", "<leader>f", find_file, { noremap = true, desc = "Open File Picker" })
			vim.keymap.set("n", "<leader>e", file_browser, { noremap = true, desc = "Toggle or focus explorer" })
			vim.keymap.set("n", "<leader>E", current_file, { noremap = true, desc = "Focus current file in explorer" })
			vim.keymap.set("n", "<leader>b", telescope_builtin.buffers, { noremap = true, desc = "Open buffer picker" })
			vim.keymap.set(
				"n",
				"<leader>j",
				telescope_builtin.jumplist,
				{ noremap = true, desc = "Open jumplist picker" }
			)
			vim.keymap.set("n", "<leader>'", telescope_builtin.resume, { noremap = true, desc = "Resume last picker" })
			vim.keymap.set("n", "<leader>/", telescope_builtin.live_grep, { noremap = true, desc = "Global search" })
			vim.keymap.set(
				"n",
				"<leader>?",
				telescope_builtin.keymaps,
				{ noremap = true, desc = "Open command palette" }
			)
			-- additional pickers
			vim.keymap.set("n", "<leader>o", recent_files, { noremap = true, desc = "Open recent file picker" })
			vim.keymap.set("n", "<leader>g?", telescope_builtin.git_status, { noremap = true, desc = "status" })

			vim.keymap.set("n", "ga", alternate, { noremap = true, desc = "Goto alternate file" })
		end,
	},
}
