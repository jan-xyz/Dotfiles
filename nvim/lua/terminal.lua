local wk = require("which-key")
wk.register({
  t = { "<cmd>FloatermToggle<CR>", "toggle terminal", noremap=true },
}, { prefix = "<leader>" })
vim.api.nvim_set_var('floaterm_position','center')
