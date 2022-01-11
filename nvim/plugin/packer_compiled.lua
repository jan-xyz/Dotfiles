-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/jan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/jan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/jan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/jan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/jan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/completion-nvim",
    url = "https://github.com/rafaelsq/completion-nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nô\3\0\0\6\0\21\0 6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\0016\0\0\0'\2\5\0B\0\2\0029\1\6\0005\3\14\0005\4\a\0005\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\15\0035\4\16\0B\1\3\0019\1\6\0005\3\19\0005\4\17\0005\5\18\0=\5\r\4=\4\15\0035\4\20\0B\1\3\1K\0\1\0\1\0\2\tmode\6v\vprefix\r<leader>\1\0\0\1\3\1\0%<cmd>'<,'>Gitsign reset_hunk<CR>\15Reset Hunk\fnoremap\2\1\0\1\tname\bGit\1\0\2\tmode\6n\vprefix\r<leader>\6g\1\0\0\6r\1\3\1\0 <cmd>Gitsign reset_hunk<CR>\15Reset Hunk\fnoremap\2\6d\1\3\1\0\"<cmd>Gitsign preview_hunk<CR>\tDiff\fnoremap\2\6b\1\3\1\0 <cmd>Gitsign blame_line<CR>\nBlame\fnoremap\2\1\0\1\tname\bGit\rregister\14which-key\fkeymaps\1\0\2\14word_diff\2\nnumhl\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim",
    url = "https://github.com/nvim-lua/lsp_extensions.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  neogit = {
    config = { "\27LJ\2\nè\1\0\0\6\0\f\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\1\5\0005\3\t\0005\4\6\0005\5\a\0=\5\b\4=\4\n\0035\4\v\0B\1\3\1K\0\1\0\1\0\2\tmode\6n\vprefix\r<leader>\6g\1\0\0\6n\1\3\1\0\20<cmd>Neogit<CR>\vNeogit\fnoremap\2\1\0\1\tname\bGit\rregister\14which-key\1\0\1 disable_commit_confirmation\2\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nord-vim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\21colorscheme nord\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nord-vim",
    url = "https://github.com/arcticicestudio/nord-vim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n·\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\ttext\18File Explorer\15text_align\tleft\rfiletype\rNvimTree\1\0\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\nð\t\0\0\6\0%\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\1\4\0005\3\26\0005\4\5\0005\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\0045\5\16\0=\5\17\0045\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\4=\4\27\0035\4\28\0B\1\3\0019\1\4\0005\3\30\0005\4\29\0=\4\t\0035\4\31\0B\1\3\0016\1 \0009\1!\1'\3\"\0B\1\2\0016\1\0\0'\3#\0B\1\2\0029\1$\1B\1\1\1K\0\1\0\18load_launchjs\19dap.ext.vscodeHautocmd FileType dap-repl lua require('dap.ext.autocompl').attach()\bcmd\bvim\1\0\2\tmode\6v\vprefix\r<leader>\1\0\0\1\3\1\0)<cmd>lua require'dap'.continue()<CR>\19Start/continue\fnoremap\2\1\0\2\tmode\6n\vprefix\r<leader>\6d\1\0\0\6l\1\3\1\0001<cmd>lua require'dap'.list_breakpoints()<CR>\21List breakpoints\fnoremap\2\6e\1\3\1\0U<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR> set conditional break point\fnoremap\2\6p\1\3\1\0\\<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>\18Set log point\fnoremap\2\6t\1\3\1\0)<cmd>lua require'dapui'.toggle()<CR>\14Toggle UI\fnoremap\2\6r\1\3\1\0*<cmd>lua require'dap'.repl.open()<CR>\tREPL\fnoremap\2\6o\1\3\1\0*<cmd>lua require'dap'.step_over()<CR>\14Step over\fnoremap\2\6u\1\3\1\0)<cmd>lua require'dap'.step_out()<CR>\rStep out\fnoremap\2\6i\1\3\1\0*<cmd>lua require'dap'.step_into()<CR>\14Step into\fnoremap\2\6c\1\3\1\0)<cmd>lua require'dap'.continue()<CR>\19Start/continue\fnoremap\2\6b\1\3\1\0002<cmd>lua require'dap'.toggle_breakpoint()<CR>\22Toggle breakpoint\fnoremap\2\1\0\1\tname\rDebugger\rregister\14which-key\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "\27LJ\2\n{\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\22virt_text_win_col\3Z highlight_changed_variables\2\nsetup\26nvim-dap-virtual-text\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-hardline"] = {
    config = { "\27LJ\2\né\5\0\0\b\0\28\0J6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\f\0005\4\4\0006\5\0\0'\a\5\0B\5\2\0029\5\6\5=\5\a\4>\4\1\0035\4\b\0006\5\0\0'\a\t\0B\5\2\0029\5\6\5=\5\a\4>\4\2\0035\4\n\0006\5\0\0'\a\v\0B\5\2\0029\5\6\5=\5\a\4>\4\3\0035\4\r\0>\4\5\0035\4\14\0006\5\0\0'\a\15\0B\5\2\0029\5\6\5=\5\a\4>\4\6\0035\4\16\0006\5\0\0'\a\17\0B\5\2\0029\5\18\5=\5\a\4>\4\a\0035\4\19\0006\5\0\0'\a\17\0B\5\2\0029\5\20\5=\5\a\4>\4\b\0035\4\21\0006\5\0\0'\a\22\0B\5\2\0029\5\6\5=\5\a\4>\4\t\0035\4\23\0006\5\0\0'\a\24\0B\5\2\0029\5\6\5=\5\a\4>\4\n\0035\4\25\0006\5\0\0'\a\26\0B\5\2\0029\5\6\5=\5\a\4>\4\v\3=\3\27\2B\0\2\1K\0\1\0\rsections\24hardline.parts.line\1\0\1\nclass\tmode\28hardline.parts.filetype\1\0\2\thide\3P\nclass\thigh\30hardline.parts.whitespace\1\0\1\nclass\fwarning\16get_warning\1\0\1\nclass\fwarning\14get_error\23hardline.parts.lsp\1\0\1\nclass\nerror\29hardline.parts.wordcount\1\0\2\thide\3d\nclass\blow\1\0\2\nclass\bmed\titem\a%=\1\5\0\0\0\0\0\a%<\28hardline.parts.filename\1\0\1\nclass\bmed\23hardline.parts.git\1\0\2\thide\3d\nclass\thigh\titem\rget_item\24hardline.parts.mode\1\0\1\nclass\tmode\1\0\1\ntheme\tnord\nsetup\rhardline\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-hardline",
    url = "https://github.com/ojroques/nvim-hardline"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n§\3\0\0\3\0\16\0.6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0016\0\0\0'\2\5\0B\0\2\0016\0\0\0'\2\6\0B\0\2\0016\0\0\0'\2\a\0B\0\2\0016\0\0\0'\2\b\0B\0\2\0016\0\0\0'\2\t\0B\0\2\0016\0\0\0'\2\n\0B\0\2\0016\0\0\0'\2\v\0B\0\2\0016\0\0\0'\2\f\0B\0\2\0016\0\0\0'\2\r\0B\0\2\0016\0\0\0'\2\14\0B\0\2\0016\0\0\0'\2\15\0B\0\2\1K\0\1\0\19languages.yaml\18languages.vim\17languages.ts\20languages.swift\20languages.scala\19languages.rust\16languages.r\21languages.python\19languages.misc\18languages.lua\21languages.kotlin\20languages.julia\17languages.go\21languages.docker\18languages.cpp\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n¡\3\0\0\5\0\18\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\0\0'\2\n\0B\0\2\0029\1\v\0005\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0B\1\3\1K\0\1\0\1\0\1\vprefix\6t\6f\1\3\1\0\30<cmd>NvimTreeFindFile<CR>\31Find file in file explorer\fnoremap\2\6e\1\0\0\1\3\1\0\28<cmd>NvimTreeToggle<CR>\25Toggle file explorer\fnoremap\2\rregister\14which-key\tview\1\0\2\16auto_resize\2\tside\tleft\bgit\1\0\1\vignore\1\16diagnostics\1\0\1\venable\2\1\0\4\18open_on_setup\1\15auto_close\1\18hijack_cursor\2\17quit_on_open\1\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n…\1\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope-dap.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n’\5\0\0\6\0\18\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\16\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\4=\4\5\0035\4\17\0B\1\3\1K\0\1\0\1\0\1\vprefix\r<leader>\1\0\0\6b\1\3\1\0008<cmd>lua require('telescope.builtin').buffers()<cr>\22List open buffers\fnoremap\2\6p\1\3\1\0008<cmd>lua require('telescope.builtin').pickers()<cr>\21List all pickers\fnoremap\2\6r\1\3\1\0007<cmd>lua require('telescope.builtin').resume()<cr>\23Resume last picker\fnoremap\2\6o\1\3\1\0009<cmd>lua require('telescope.builtin').oldfiles()<cr>\21Open Recent File\fnoremap\2\6g\1\3\1\0:<cmd>lua require('telescope.builtin').live_grep()<cr>\17Find in File\fnoremap\2\6f\1\3\1\0;<cmd>lua require('telescope.builtin').find_files()<cr>\14Find File\fnoremap\2\1\0\1\tname\tFile\rregister\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nà\3\0\0\5\0\20\0 6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0+\3\1\0B\0\3\0016\0\a\0'\2\b\0B\0\2\0026\1\a\0'\3\t\0B\1\2\0029\1\n\0015\3\v\0B\1\2\0019\1\f\0005\3\14\0005\4\r\0=\4\15\0035\4\16\0B\1\3\0019\1\f\0005\3\18\0005\4\17\0=\4\15\0035\4\19\0B\1\3\1K\0\1\0\1\0\2\tmode\6t\vprefix\r<leader>\1\0\0\1\3\1\0\24<cmd>ToggleTerm<CR>\20Toggle terminal\fnoremap\2\1\0\1\vprefix\r<leader>\6t\1\0\0\1\3\1\0\24<cmd>ToggleTerm<CR>\20Toggle terminal\fnoremap\2\rregister\1\0\1\14direction\nfloat\nsetup\15toggleterm\14which-key\frequireJ autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete \14nvim_exec\bapi nvr -cc split --remote-wait\15GIT_EDITOR\benv\bvim\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-sanegx"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vim-sanegx",
    url = "https://github.com/felipec/vim-sanegx"
  },
  ["vista.vim"] = {
    config = { "\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rnvim_lsp\28vista_default_executive\6g\bvim\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n°\1\0\0\6\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0B\1\3\1K\0\1\0\1\0\2\tmode\6n\vprefix\r<leader>\6b\1\0\0\6d\1\3\1\0\16<cmd>bd<CR>\vdelete\fnoremap\2\1\0\1\tname\vbuffer\rregister\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n¡\3\0\0\5\0\18\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\0\0'\2\n\0B\0\2\0029\1\v\0005\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0B\1\3\1K\0\1\0\1\0\1\vprefix\6t\6f\1\3\1\0\30<cmd>NvimTreeFindFile<CR>\31Find file in file explorer\fnoremap\2\6e\1\0\0\1\3\1\0\28<cmd>NvimTreeToggle<CR>\25Toggle file explorer\fnoremap\2\rregister\14which-key\tview\1\0\2\16auto_resize\2\tside\tleft\bgit\1\0\1\vignore\1\16diagnostics\1\0\1\venable\2\1\0\4\18open_on_setup\1\15auto_close\1\18hijack_cursor\2\17quit_on_open\1\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: telescope-dap.nvim
time([[Config for telescope-dap.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0", "config", "telescope-dap.nvim")
time([[Config for telescope-dap.nvim]], false)
-- Config for: nord-vim
time([[Config for nord-vim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\21colorscheme nord\bcmd\bvim\0", "config", "nord-vim")
time([[Config for nord-vim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n°\1\0\0\6\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0B\1\3\1K\0\1\0\1\0\2\tmode\6n\vprefix\r<leader>\6b\1\0\0\6d\1\3\1\0\16<cmd>bd<CR>\vdelete\fnoremap\2\1\0\1\tname\vbuffer\rregister\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n’\5\0\0\6\0\18\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\16\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\4=\4\5\0035\4\17\0B\1\3\1K\0\1\0\1\0\1\vprefix\r<leader>\1\0\0\6b\1\3\1\0008<cmd>lua require('telescope.builtin').buffers()<cr>\22List open buffers\fnoremap\2\6p\1\3\1\0008<cmd>lua require('telescope.builtin').pickers()<cr>\21List all pickers\fnoremap\2\6r\1\3\1\0007<cmd>lua require('telescope.builtin').resume()<cr>\23Resume last picker\fnoremap\2\6o\1\3\1\0009<cmd>lua require('telescope.builtin').oldfiles()<cr>\21Open Recent File\fnoremap\2\6g\1\3\1\0:<cmd>lua require('telescope.builtin').live_grep()<cr>\17Find in File\fnoremap\2\6f\1\3\1\0;<cmd>lua require('telescope.builtin').find_files()<cr>\14Find File\fnoremap\2\1\0\1\tname\tFile\rregister\14which-key\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n·\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\ttext\18File Explorer\15text_align\tleft\rfiletype\rNvimTree\1\0\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\nð\t\0\0\6\0%\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\1\4\0005\3\26\0005\4\5\0005\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\0045\5\16\0=\5\17\0045\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\4=\4\27\0035\4\28\0B\1\3\0019\1\4\0005\3\30\0005\4\29\0=\4\t\0035\4\31\0B\1\3\0016\1 \0009\1!\1'\3\"\0B\1\2\0016\1\0\0'\3#\0B\1\2\0029\1$\1B\1\1\1K\0\1\0\18load_launchjs\19dap.ext.vscodeHautocmd FileType dap-repl lua require('dap.ext.autocompl').attach()\bcmd\bvim\1\0\2\tmode\6v\vprefix\r<leader>\1\0\0\1\3\1\0)<cmd>lua require'dap'.continue()<CR>\19Start/continue\fnoremap\2\1\0\2\tmode\6n\vprefix\r<leader>\6d\1\0\0\6l\1\3\1\0001<cmd>lua require'dap'.list_breakpoints()<CR>\21List breakpoints\fnoremap\2\6e\1\3\1\0U<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR> set conditional break point\fnoremap\2\6p\1\3\1\0\\<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>\18Set log point\fnoremap\2\6t\1\3\1\0)<cmd>lua require'dapui'.toggle()<CR>\14Toggle UI\fnoremap\2\6r\1\3\1\0*<cmd>lua require'dap'.repl.open()<CR>\tREPL\fnoremap\2\6o\1\3\1\0*<cmd>lua require'dap'.step_over()<CR>\14Step over\fnoremap\2\6u\1\3\1\0)<cmd>lua require'dap'.step_out()<CR>\rStep out\fnoremap\2\6i\1\3\1\0*<cmd>lua require'dap'.step_into()<CR>\14Step into\fnoremap\2\6c\1\3\1\0)<cmd>lua require'dap'.continue()<CR>\19Start/continue\fnoremap\2\6b\1\3\1\0002<cmd>lua require'dap'.toggle_breakpoint()<CR>\22Toggle breakpoint\fnoremap\2\1\0\1\tname\rDebugger\rregister\14which-key\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: nvim-hardline
time([[Config for nvim-hardline]], true)
try_loadstring("\27LJ\2\né\5\0\0\b\0\28\0J6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\f\0005\4\4\0006\5\0\0'\a\5\0B\5\2\0029\5\6\5=\5\a\4>\4\1\0035\4\b\0006\5\0\0'\a\t\0B\5\2\0029\5\6\5=\5\a\4>\4\2\0035\4\n\0006\5\0\0'\a\v\0B\5\2\0029\5\6\5=\5\a\4>\4\3\0035\4\r\0>\4\5\0035\4\14\0006\5\0\0'\a\15\0B\5\2\0029\5\6\5=\5\a\4>\4\6\0035\4\16\0006\5\0\0'\a\17\0B\5\2\0029\5\18\5=\5\a\4>\4\a\0035\4\19\0006\5\0\0'\a\17\0B\5\2\0029\5\20\5=\5\a\4>\4\b\0035\4\21\0006\5\0\0'\a\22\0B\5\2\0029\5\6\5=\5\a\4>\4\t\0035\4\23\0006\5\0\0'\a\24\0B\5\2\0029\5\6\5=\5\a\4>\4\n\0035\4\25\0006\5\0\0'\a\26\0B\5\2\0029\5\6\5=\5\a\4>\4\v\3=\3\27\2B\0\2\1K\0\1\0\rsections\24hardline.parts.line\1\0\1\nclass\tmode\28hardline.parts.filetype\1\0\2\thide\3P\nclass\thigh\30hardline.parts.whitespace\1\0\1\nclass\fwarning\16get_warning\1\0\1\nclass\fwarning\14get_error\23hardline.parts.lsp\1\0\1\nclass\nerror\29hardline.parts.wordcount\1\0\2\thide\3d\nclass\blow\1\0\2\nclass\bmed\titem\a%=\1\5\0\0\0\0\0\a%<\28hardline.parts.filename\1\0\1\nclass\bmed\23hardline.parts.git\1\0\2\thide\3d\nclass\thigh\titem\rget_item\24hardline.parts.mode\1\0\1\nclass\tmode\1\0\1\ntheme\tnord\nsetup\rhardline\frequire\0", "config", "nvim-hardline")
time([[Config for nvim-hardline]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nà\3\0\0\5\0\20\0 6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0+\3\1\0B\0\3\0016\0\a\0'\2\b\0B\0\2\0026\1\a\0'\3\t\0B\1\2\0029\1\n\0015\3\v\0B\1\2\0019\1\f\0005\3\14\0005\4\r\0=\4\15\0035\4\16\0B\1\3\0019\1\f\0005\3\18\0005\4\17\0=\4\15\0035\4\19\0B\1\3\1K\0\1\0\1\0\2\tmode\6t\vprefix\r<leader>\1\0\0\1\3\1\0\24<cmd>ToggleTerm<CR>\20Toggle terminal\fnoremap\2\1\0\1\vprefix\r<leader>\6t\1\0\0\1\3\1\0\24<cmd>ToggleTerm<CR>\20Toggle terminal\fnoremap\2\rregister\1\0\1\14direction\nfloat\nsetup\15toggleterm\14which-key\frequireJ autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete \14nvim_exec\bapi nvr -cc split --remote-wait\15GIT_EDITOR\benv\bvim\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\nè\1\0\0\6\0\f\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\1\5\0005\3\t\0005\4\6\0005\5\a\0=\5\b\4=\4\n\0035\4\v\0B\1\3\1K\0\1\0\1\0\2\tmode\6n\vprefix\r<leader>\6g\1\0\0\6n\1\3\1\0\20<cmd>Neogit<CR>\vNeogit\fnoremap\2\1\0\1\tname\bGit\rregister\14which-key\1\0\1 disable_commit_confirmation\2\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: vista.vim
time([[Config for vista.vim]], true)
try_loadstring("\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rnvim_lsp\28vista_default_executive\6g\bvim\0", "config", "vista.vim")
time([[Config for vista.vim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n§\3\0\0\3\0\16\0.6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0016\0\0\0'\2\5\0B\0\2\0016\0\0\0'\2\6\0B\0\2\0016\0\0\0'\2\a\0B\0\2\0016\0\0\0'\2\b\0B\0\2\0016\0\0\0'\2\t\0B\0\2\0016\0\0\0'\2\n\0B\0\2\0016\0\0\0'\2\v\0B\0\2\0016\0\0\0'\2\f\0B\0\2\0016\0\0\0'\2\r\0B\0\2\0016\0\0\0'\2\14\0B\0\2\0016\0\0\0'\2\15\0B\0\2\1K\0\1\0\19languages.yaml\18languages.vim\17languages.ts\20languages.swift\20languages.scala\19languages.rust\16languages.r\21languages.python\19languages.misc\18languages.lua\21languages.kotlin\20languages.julia\17languages.go\21languages.docker\18languages.cpp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nô\3\0\0\6\0\21\0 6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\0016\0\0\0'\2\5\0B\0\2\0029\1\6\0005\3\14\0005\4\a\0005\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\15\0035\4\16\0B\1\3\0019\1\6\0005\3\19\0005\4\17\0005\5\18\0=\5\r\4=\4\15\0035\4\20\0B\1\3\1K\0\1\0\1\0\2\tmode\6v\vprefix\r<leader>\1\0\0\1\3\1\0%<cmd>'<,'>Gitsign reset_hunk<CR>\15Reset Hunk\fnoremap\2\1\0\1\tname\bGit\1\0\2\tmode\6n\vprefix\r<leader>\6g\1\0\0\6r\1\3\1\0 <cmd>Gitsign reset_hunk<CR>\15Reset Hunk\fnoremap\2\6d\1\3\1\0\"<cmd>Gitsign preview_hunk<CR>\tDiff\fnoremap\2\6b\1\3\1\0 <cmd>Gitsign blame_line<CR>\nBlame\fnoremap\2\1\0\1\tname\bGit\rregister\14which-key\fkeymaps\1\0\2\14word_diff\2\nnumhl\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-dap-virtual-text
time([[Config for nvim-dap-virtual-text]], true)
try_loadstring("\27LJ\2\n{\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\22virt_text_win_col\3Z highlight_changed_variables\2\nsetup\26nvim-dap-virtual-text\frequire\0", "config", "nvim-dap-virtual-text")
time([[Config for nvim-dap-virtual-text]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n…\1\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
