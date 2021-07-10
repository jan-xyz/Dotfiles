local dap = require('dap')

-- keymap
local map = vim.api.nvim_set_keymap
OPTIONS = { noremap = true, silent = true }
map("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = true;})
map("n", "<leader>c", "<cmd>lua require'dap'.continue()<CR>", {silent = true;})
map("n", "<leader>i", "<cmd>lua require'dap'.step_into()<CR>", {silent = true;})
map("n", "<leader>u", "<cmd>lua require'dap'.step_out()<CR>", {silent = true;})
map("n", "<leader>o", "<cmd>lua require'dap'.step_over()<CR>", {silent = true;})

-- add autocompletion to DAP repl
vim.cmd [[autocmd FileType dap-repl lua require('dap.ext.autocompl').attach()]]

-- inline DAP informatino during debugging
vim.g.dap_virtual_text = true

-- Telescop integration
require('telescope').load_extension('dap')

-- Go support
dap.adapters.go = function(callback, config)
    local handle
    local pid_or_err
    local port = 38697
    handle, pid_or_err =
      vim.loop.spawn(
      "dlv",
      {
        args = {"dap", "-l", "127.0.0.1:" .. port},
        detached = true
      },
      function(code)
        handle:close()
        print("Delve exited with exit code: " .. code)
      end
    )
    -- Wait 100ms for delve to start
    vim.defer_fn(
      function()
        --dap.repl.open()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      100)


    --callback({type = "server", host = "127.0.0.1", port = port})
  end
  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
  dap.configurations.go = {
    {
      type = "go",
      name = "Debug main.go",
      request = "launch",
      program = "${workspaceFolder}/main.go"
    },
    {
      type = "go",
      name = "Debug current file",
      request = "launch",
      program = "${file}"
    },
    {
      type = "go",
      name = "Debug tests in current dir", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${fileDirname}"
    },
}
