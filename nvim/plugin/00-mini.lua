-- other plugin files depend on these modules, and plugin files load in name order
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
