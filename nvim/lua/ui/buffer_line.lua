local packer = require("packer")
packer.use({
	"akinsho/nvim-bufferline.lua",
	requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left" } },
				close_command = "Bdelete! %d", -- comes from moll/vim-bbye
				right_mouse_command = "", -- comes from moll/vim-bbye
				groups = {
					options = {
						toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
					},
					items = {
						{
							name = "Git",
							auto_close = true,
							matcher = function(buf)
								return buf.path:find("/.git/") or buf.filename:find(".git")
							end,
						},
						{
							name = "Docs",
							icon = "",
							auto_close = true,
							matcher = function(buf)
								return buf.extension == "md"
							end,
						},
						{
							name = "Config",
							auto_close = true,
							matcher = function(buf)
								return buf.filename == "go.mod"
									or buf.filename == "go.sum"
									or buf.filename == "Cargo.toml"
									or buf.filename == "requirements.txt"
									or buf.filename == "Pyproject.toml"
									or buf.filename == "config.toml"
							end,
						},
						{
							name = "Tests",
							icon = "",
							matcher = function(buf)
								return buf.filename:find("_test") or buf.filename:find("test_")
							end,
						},
						{
							name = "Source",
							matcher = function(buf)
								print(vim.inspect(buf))
								return true
							end,
						},
					},
				},
			},
		})
	end,
})
