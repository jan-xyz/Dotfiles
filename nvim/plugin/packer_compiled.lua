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
  local success, result = pcall(loadstring(s))
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
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\nw\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\bâ–ˆ\tmode\afn\25hi GalaxyLeft guifg=\17nvim_command\bapi\bvimÓ\1\0\0\a\4\t\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1-\0\1\0006\1\0\0009\1\4\0019\1\5\1B\1\1\0028\0\1\0-\1\2\0006\2\6\0009\2\a\2)\4\n\0-\5\3\0009\5\b\5B\5\1\0A\2\1\0028\1\2\1&\0\1\0L\0\2\0\bÀ\tÀ\nÀ\2À\22get_buffer_number\bmin\tmath\tmode\afn\28hi GalaxyModeNum guibg=\17nvim_command\bapi\bvim|\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\vî‚¾â–ˆ\tmode\afn\27hi GalaxyBufSep guibg=\17nvim_command\bapi\bvim{\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\tî‚¼ \tmode\afn\28hi GalaxyFileSep guibg=\17nvim_command\bapi\bvimà\1\0\0\t\2\n\0\0245\0\0\0-\1\0\0009\1\1\1B\1\1\2-\2\0\0009\2\2\2B\2\1\0026\3\3\0009\3\4\0039\3\5\3'\5\6\0-\6\1\0006\a\3\0009\a\a\a9\a\b\aB\a\1\0028\6\a\6&\5\6\5B\3\2\1\18\3\1\0'\4\t\0008\5\2\0&\3\5\3L\3\2\0\5À\bÀ\6 \tmode\afn\27hi GalaxyFileEF guibg=\17nvim_command\bapi\bvim\20get_file_format\20get_file_encode\1\0\3\tUNIX\tîœ’ \bMAC\tïŒ‚ \bDOS\tî˜ª {\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\vî‚¾â–ˆ\tmode\afn\26hi GalaxyEFSep guibg=\17nvim_command\bapi\bvim²\1\0\0\6\2\n\0\0236\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1-\0\1\0009\0\6\0B\0\1\2\v\0\0\0X\1\1€'\0\a\0'\1\b\0\18\2\0\0'\3\t\0&\1\3\1L\1\2\0\bÀ\aÀ\6 \tîœ¥ \b???\19get_git_branch\tmode\afn\24hi GalaxyGit guifg=\17nvim_command\bapi\bvim\v\0\0\1\0\0\0\1K\0\1\0Ë\1\0\0\b\2\v\0\25'\0\0\0-\1\0\0009\1\1\1B\1\1\2\a\1\2\0X\2\2€'\0\3\0'\1\3\0006\2\4\0009\2\5\0029\2\6\2'\4\a\0-\5\1\0006\6\4\0009\6\b\0069\6\t\6B\6\1\0028\5\6\5&\4\5\4B\2\2\1\18\2\0\0\18\3\1\0'\4\n\0&\2\4\2L\2\2\0\6À\bÀ\6 \tmode\afn\30hi GalaxyLspClient guifg=\17nvim_command\bapi\bvim\5\18No Active Lsp\19get_lsp_client\tï‚… z\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2€K\0\1\0X\2\5€\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \nError\14get_count\15diagnostic\blsp\bvim\tï— \0|\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2€K\0\1\0X\2\5€\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \fWarning\14get_count\15diagnostic\blsp\bvim\tï± \0y\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2€K\0\1\0X\2\5€\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \tHint\14get_count\15diagnostic\blsp\bvim\tïª \0€\1\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2€K\0\1\0X\2\5€\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \16Information\14get_count\15diagnostic\blsp\bvim\tïš \0{\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\tî‚¼ \tmode\afn\28hi GalaxyLineSep guibg=\17nvim_command\bapi\bvimä\1\0\0\a\1\v\0\0296\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\0026\1\0\0009\1\1\0019\1\3\1'\3\4\0-\4\0\0006\5\0\0009\5\5\0059\5\6\5B\5\1\0028\4\5\4&\3\4\3B\1\2\1'\1\a\0:\2\1\0'\3\b\0006\4\0\0009\4\1\0049\4\t\4)\6\0\0B\4\2\2'\5\n\0:\6\2\0&\1\6\1L\1\2\0\bÀ\6:\24nvim_buf_line_count\6/\tâ˜° \tmode\afn\29hi GalaxyLineInfo guibg=\17nvim_command\24nvim_win_get_cursor\bapi\bvimx\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\bâ–ˆ\tmode\afn\26hi GalaxyRight guifg=\17nvim_command\bapi\bvimw\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\bâ–ˆ\tmode\afn\25hi GalaxyLeft guifg=\17nvim_command\bapi\bvimÓ\1\0\0\a\4\t\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1-\0\1\0006\1\0\0009\1\4\0019\1\5\1B\1\1\0028\0\1\0-\1\2\0006\2\6\0009\2\a\2)\4\n\0-\5\3\0009\5\b\5B\5\1\0A\2\1\0028\1\2\1&\0\1\0L\0\2\0\bÀ\tÀ\nÀ\2À\22get_buffer_number\bmin\tmath\tmode\afn\28hi GalaxyModeNum guibg=\17nvim_command\bapi\bvim|\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\vî‚¾â–ˆ\tmode\afn\27hi GalaxyBufSep guibg=\17nvim_command\bapi\bvim{\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\tî‚¼ \tmode\afn\28hi GalaxyLineSep guibg=\17nvim_command\bapi\bvimä\1\0\0\a\1\v\0\0296\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\0026\1\0\0009\1\1\0019\1\3\1'\3\4\0-\4\0\0006\5\0\0009\5\5\0059\5\6\5B\5\1\0028\4\5\4&\3\4\3B\1\2\1'\1\a\0:\2\1\0'\3\b\0006\4\0\0009\4\1\0049\4\t\4)\6\0\0B\4\2\2'\5\n\0:\6\2\0&\1\6\1L\1\2\0\bÀ\6:\24nvim_buf_line_count\6/\tâ˜° \tmode\afn\29hi GalaxyLineInfo guibg=\17nvim_command\24nvim_win_get_cursor\bapi\bvimx\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\bâ–ˆ\tmode\afn\26hi GalaxyRight guifg=\17nvim_command\bapi\bvimì\23\1\0\16\0¤\1\0—\0036\0\0\0'\2\1\0B\0\2\0029\1\2\0006\2\0\0'\4\3\0B\2\2\0025\3\4\0006\4\0\0'\6\5\0B\4\2\0026\5\0\0'\a\6\0B\5\2\0026\6\0\0'\b\a\0B\6\2\0026\a\0\0'\t\b\0B\a\2\0025\b\n\0=\b\t\0005\b\f\0009\t\v\3=\t\r\b9\t\14\3=\t\15\b9\t\16\3=\t\17\b9\t\18\3=\t\19\b9\t\18\3=\t\20\b9\t\21\3=\t\22\b9\t\21\3=\t\23\b9\t\21\3=\t\24\b9\t\21\3=\t\25\b9\t\26\3=\t\27\b9\t\26\3=\t\28\b9\t\26\3=\t\29\b9\t\30\3=\t\31\b9\t\30\3=\t \b9\t!\3=\t\"\b9\t!\3=\t#\b9\t!\3=\t$\b9\t\30\3=\t%\b9\t\14\3=\t&\b9\t\14\3=\t'\b9\t\14\3=\t(\b5\t)\0005\n*\0009\v+\0015\f1\0005\r-\0004\14\3\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14/\0=\0140\r=\r2\f>\f\0\v9\v+\0015\f7\0005\r5\0005\0144\0009\0153\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\0146\0=\0140\r=\r8\f>\f\1\v9\v+\0015\f;\0005\r9\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14:\0=\0140\r=\r<\f>\f\2\v9\v+\0015\fA\0005\r>\0009\14=\4=\14?\r4\14\3\0009\15@\5>\15\1\0149\15,\3>\15\2\14=\14.\r=\rB\f>\f\3\v9\v+\0015\fF\0005\rC\0009\14=\4=\14?\r5\14E\0009\15D\3>\15\1\0149\15,\3>\15\2\14=\14.\r=\rG\f>\f\4\v9\v+\0015\fJ\0005\rH\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14I\0=\0140\r=\rK\f>\f\5\v9\v+\0015\fO\0005\rM\0005\14L\0009\0153\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14N\0=\0140\r=\rP\f>\f\6\v9\v+\0015\fS\0005\rQ\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14R\0=\0140\r=\rT\f>\f\a\v9\v+\0015\fY\0005\rV\0009\14U\4=\14?\r5\14W\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14X\0=\0140\r=\rZ\f>\f\b\v9\v[\0015\f^\0005\r\\\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14]\0=\0140\r=\r_\f>\f\0\v9\v`\0015\fe\0005\rc\0005\14b\0009\15a\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14d\0=\0140\r=\rf\f>\f\0\v9\v`\0015\fj\0005\rh\0005\14g\0009\15\14\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14i\0=\0140\r=\rk\f>\f\1\v9\v`\0015\fo\0005\rm\0005\14l\0009\15\18\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14n\0=\0140\r=\rp\f>\f\2\v9\v`\0015\ft\0005\rr\0005\14q\0009\15\26\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14s\0=\0140\r=\ru\f>\f\3\v9\v`\0015\fy\0005\rw\0005\14v\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14x\0=\0140\r=\rz\f>\f\4\v9\v`\0015\f}\0005\r{\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14|\0=\0140\r=\r~\f>\f\5\v9\v`\0015\f‚\0005\r€\0005\14\0009\0153\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14\0=\0140\r=\rƒ\f>\f\6\v9\v`\0015\f†\0005\r„\0004\14\3\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14…\0=\0140\r=\r‡\f>\f\a\v9\vˆ\0015\fŒ\0005\rŠ\0004\14\3\0009\15\21\3>\15\1\0149\15‰\3>\15\2\14=\14.\r3\14‹\0=\0140\r=\r2\f>\f\0\v9\vˆ\0015\f\0005\rŽ\0005\14\0009\0153\3>\15\1\0149\15‰\3>\15\2\14=\14.\r3\14\0=\0140\r=\r8\f>\f\1\v9\vˆ\0015\f“\0005\r‘\0004\14\3\0009\15‰\3>\15\1\0149\15‰\3>\15\2\14=\14.\r3\14’\0=\0140\r=\r<\f>\f\2\v9\vˆ\0015\f•\0005\r”\0009\14=\4=\14?\r4\14\3\0009\15@\5>\15\1\0149\15‰\3>\15\2\14=\14.\r=\rB\f>\f\3\v9\vˆ\0015\f˜\0005\r—\0005\14–\0009\15D\3>\15\1\0149\15‰\3>\15\2\14=\14.\r=\rG\f>\f\4\v9\v™\0015\fœ\0005\rš\0004\14\3\0009\15‰\3>\15\1\0149\15‰\3>\15\2\14=\14.\r3\14›\0=\0140\r=\r~\f>\f\1\v9\v™\0015\f \0005\rž\0005\14\0009\0153\3>\15\1\0149\15‰\3>\15\2\14=\14.\r3\14Ÿ\0=\0140\r=\rƒ\f>\f\2\v9\v™\0015\f£\0005\r¡\0004\14\3\0009\15\21\3>\15\1\0149\15‰\3>\15\2\14=\14.\r3\14¢\0=\0140\r=\r‡\f>\f\3\v2\0\0€K\0\1\0\1\0\0\0\1\0\0\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\1\0\0\0\1\0\0\21short_line_right\1\0\0\1\0\1\rprovider\rFileName\1\4\0\0\0\0\tbold\1\0\0\1\0\1\rprovider\rFileIcon\1\0\0\0\1\0\0\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\1\0\0\0\1\0\0\abg\20short_line_left\nRight\1\0\0\0\1\0\0\rLineInfo\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\fLineSep\1\0\0\0\1\0\0\19DiagnosticInfo\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\19DiagnosticHint\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\19DiagnosticWarn\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\20DiagnosticError\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\14LspClient\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\afg\nright\nEmpty\1\0\0\0\1\0\0\bmid\bGit\1\0\0\0\1\4\0\0\0\0\tbold\1\0\0\24check_git_workspace\nEFSep\1\0\0\0\1\0\0\vFileEF\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\fFileSep\1\0\0\0\1\0\0\rFileName\1\0\0\1\4\0\0\0\0\tbold\nwhite\1\0\1\rprovider\rFileName\rFileIcon\1\0\0\24get_file_icon_color\14condition\1\0\1\rprovider\rFileIcon\21buffer_not_empty\vBufSep\1\0\0\0\1\0\0\fModeNum\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\nblack\tLeft\1\0\0\rprovider\0\14highlight\1\0\0\18bg_statusline\tleft\1\v\0\0\tâžŠ \tâ· \tâžŒ \tâž \tâžŽ \tâž \tâž \tâž‘ \tâž’ \tïª \1\0\18\aix\nðŸ…˜ \6n\nðŸ… \6c\nðŸ…’ \6t\nðŸ…£ \6i\nðŸ…˜ \aic\nðŸ…˜ \aRv\nðŸ…¡ \6!\nðŸ…’ \6s\nðŸ…¢ \6\22\nðŸ…¥ \6V\nðŸ…¥ \6S\nðŸ…¢ \6R\nðŸ…¡ \ar?\nðŸ…¡ \arm\nðŸ…¡ \6v\nðŸ…¥ \6r\nðŸ…¡ \6\19\nðŸ…¢ \6\22\6V\6v\6t\6\19\6S\6s\vorange\aRv\6R\vpurple\ar?\arm\6r\tcyan\bnoV\bnov\ano\6n\tblue\aix\aic\vyellow\6i\ngreen\6!\bred\6c\1\0\0\fmagenta\1\4\0\0\rNvimTree\thelp\vtagbar\20short_line_list\28galaxyline.provider_vcs\28galaxyline.provider_lsp!galaxyline.provider_fileinfo\25galaxyline.condition\1\0\r\tcyan\f#88C0D0\abg\f#4C566A\tblue\f#5E81AC\nblack\f#2E3440\vorange\f#D08770\18bg_statusline\f#4C566A\vpurple\f#B48EAD\nwhite\f#ECEFF4\ngreen\f#A3BE8C\fmagenta\f#8FBCBB\vyellow\f#EBCB8B\bred\f#BF616A\tgray\f#4b5263\31galaxyline.provider_buffer\fsection\15galaxyline\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nnumhl\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  neogit = {
    config = { "\27LJ\2\nX\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1 disable_commit_confirmation\2\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n·\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\15text_align\tleft\ttext\18File Explorer\rfiletype\rNvimTree\1\0\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n÷\3\0\0\5\0\18\0(6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\0\0=\1\a\0006\0\0\0009\0\1\0)\1\0\0=\1\b\0006\0\t\0'\2\n\0B\0\2\0029\1\v\0005\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0B\1\3\1K\0\1\0\1\0\1\vprefix\6t\6f\1\3\1\0\30<cmd>NvimTreeFindFile<CR>\31Find file in file explorer\fnoremap\2\6e\1\0\0\1\3\1\0\28<cmd>NvimTreeToggle<CR>\25Toggle file explorer\fnoremap\2\rregister\14which-key\frequire\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\30nvim_tree_lsp_diagnostics\27nvim_tree_add_trailing\27nvim_tree_quit_on_open\25nvim_tree_auto_close\24nvim_tree_auto_open\6g\bvim\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-sanegx"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vim-sanegx"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n÷\3\0\0\5\0\18\0(6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\0\0=\1\a\0006\0\0\0009\0\1\0)\1\0\0=\1\b\0006\0\t\0'\2\n\0B\0\2\0029\1\v\0005\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0B\1\3\1K\0\1\0\1\0\1\vprefix\6t\6f\1\3\1\0\30<cmd>NvimTreeFindFile<CR>\31Find file in file explorer\fnoremap\2\6e\1\0\0\1\3\1\0\28<cmd>NvimTreeToggle<CR>\25Toggle file explorer\fnoremap\2\rregister\14which-key\frequire\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\30nvim_tree_lsp_diagnostics\27nvim_tree_add_trailing\27nvim_tree_quit_on_open\25nvim_tree_auto_close\24nvim_tree_auto_open\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\nX\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1 disable_commit_confirmation\2\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nnumhl\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\nw\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\bâ–ˆ\tmode\afn\25hi GalaxyLeft guifg=\17nvim_command\bapi\bvimÓ\1\0\0\a\4\t\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1-\0\1\0006\1\0\0009\1\4\0019\1\5\1B\1\1\0028\0\1\0-\1\2\0006\2\6\0009\2\a\2)\4\n\0-\5\3\0009\5\b\5B\5\1\0A\2\1\0028\1\2\1&\0\1\0L\0\2\0\bÀ\tÀ\nÀ\2À\22get_buffer_number\bmin\tmath\tmode\afn\28hi GalaxyModeNum guibg=\17nvim_command\bapi\bvim|\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\vî‚¾â–ˆ\tmode\afn\27hi GalaxyBufSep guibg=\17nvim_command\bapi\bvim{\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\tî‚¼ \tmode\afn\28hi GalaxyFileSep guibg=\17nvim_command\bapi\bvimà\1\0\0\t\2\n\0\0245\0\0\0-\1\0\0009\1\1\1B\1\1\2-\2\0\0009\2\2\2B\2\1\0026\3\3\0009\3\4\0039\3\5\3'\5\6\0-\6\1\0006\a\3\0009\a\a\a9\a\b\aB\a\1\0028\6\a\6&\5\6\5B\3\2\1\18\3\1\0'\4\t\0008\5\2\0&\3\5\3L\3\2\0\5À\bÀ\6 \tmode\afn\27hi GalaxyFileEF guibg=\17nvim_command\bapi\bvim\20get_file_format\20get_file_encode\1\0\3\tUNIX\tîœ’ \bMAC\tïŒ‚ \bDOS\tî˜ª {\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\vî‚¾â–ˆ\tmode\afn\26hi GalaxyEFSep guibg=\17nvim_command\bapi\bvim²\1\0\0\6\2\n\0\0236\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1-\0\1\0009\0\6\0B\0\1\2\v\0\0\0X\1\1€'\0\a\0'\1\b\0\18\2\0\0'\3\t\0&\1\3\1L\1\2\0\bÀ\aÀ\6 \tîœ¥ \b???\19get_git_branch\tmode\afn\24hi GalaxyGit guifg=\17nvim_command\bapi\bvim\v\0\0\1\0\0\0\1K\0\1\0Ë\1\0\0\b\2\v\0\25'\0\0\0-\1\0\0009\1\1\1B\1\1\2\a\1\2\0X\2\2€'\0\3\0'\1\3\0006\2\4\0009\2\5\0029\2\6\2'\4\a\0-\5\1\0006\6\4\0009\6\b\0069\6\t\6B\6\1\0028\5\6\5&\4\5\4B\2\2\1\18\2\0\0\18\3\1\0'\4\n\0&\2\4\2L\2\2\0\6À\bÀ\6 \tmode\afn\30hi GalaxyLspClient guifg=\17nvim_command\bapi\bvim\5\18No Active Lsp\19get_lsp_client\tï‚… z\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2€K\0\1\0X\2\5€\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \nError\14get_count\15diagnostic\blsp\bvim\tï— \0|\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2€K\0\1\0X\2\5€\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \fWarning\14get_count\15diagnostic\blsp\bvim\tï± \0y\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2€K\0\1\0X\2\5€\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \tHint\14get_count\15diagnostic\blsp\bvim\tïª \0€\1\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2€K\0\1\0X\2\5€\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \16Information\14get_count\15diagnostic\blsp\bvim\tïš \0{\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\tî‚¼ \tmode\afn\28hi GalaxyLineSep guibg=\17nvim_command\bapi\bvimä\1\0\0\a\1\v\0\0296\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\0026\1\0\0009\1\1\0019\1\3\1'\3\4\0-\4\0\0006\5\0\0009\5\5\0059\5\6\5B\5\1\0028\4\5\4&\3\4\3B\1\2\1'\1\a\0:\2\1\0'\3\b\0006\4\0\0009\4\1\0049\4\t\4)\6\0\0B\4\2\2'\5\n\0:\6\2\0&\1\6\1L\1\2\0\bÀ\6:\24nvim_buf_line_count\6/\tâ˜° \tmode\afn\29hi GalaxyLineInfo guibg=\17nvim_command\24nvim_win_get_cursor\bapi\bvimx\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\bâ–ˆ\tmode\afn\26hi GalaxyRight guifg=\17nvim_command\bapi\bvimw\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\bâ–ˆ\tmode\afn\25hi GalaxyLeft guifg=\17nvim_command\bapi\bvimÓ\1\0\0\a\4\t\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1-\0\1\0006\1\0\0009\1\4\0019\1\5\1B\1\1\0028\0\1\0-\1\2\0006\2\6\0009\2\a\2)\4\n\0-\5\3\0009\5\b\5B\5\1\0A\2\1\0028\1\2\1&\0\1\0L\0\2\0\bÀ\tÀ\nÀ\2À\22get_buffer_number\bmin\tmath\tmode\afn\28hi GalaxyModeNum guibg=\17nvim_command\bapi\bvim|\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\vî‚¾â–ˆ\tmode\afn\27hi GalaxyBufSep guibg=\17nvim_command\bapi\bvim{\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\tî‚¼ \tmode\afn\28hi GalaxyLineSep guibg=\17nvim_command\bapi\bvimä\1\0\0\a\1\v\0\0296\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\0026\1\0\0009\1\1\0019\1\3\1'\3\4\0-\4\0\0006\5\0\0009\5\5\0059\5\6\5B\5\1\0028\4\5\4&\3\4\3B\1\2\1'\1\a\0:\2\1\0'\3\b\0006\4\0\0009\4\1\0049\4\t\4)\6\0\0B\4\2\2'\5\n\0:\6\2\0&\1\6\1L\1\2\0\bÀ\6:\24nvim_buf_line_count\6/\tâ˜° \tmode\afn\29hi GalaxyLineInfo guibg=\17nvim_command\24nvim_win_get_cursor\bapi\bvimx\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\bÀ\bâ–ˆ\tmode\afn\26hi GalaxyRight guifg=\17nvim_command\bapi\bvimì\23\1\0\16\0¤\1\0—\0036\0\0\0'\2\1\0B\0\2\0029\1\2\0006\2\0\0'\4\3\0B\2\2\0025\3\4\0006\4\0\0'\6\5\0B\4\2\0026\5\0\0'\a\6\0B\5\2\0026\6\0\0'\b\a\0B\6\2\0026\a\0\0'\t\b\0B\a\2\0025\b\n\0=\b\t\0005\b\f\0009\t\v\3=\t\r\b9\t\14\3=\t\15\b9\t\16\3=\t\17\b9\t\18\3=\t\19\b9\t\18\3=\t\20\b9\t\21\3=\t\22\b9\t\21\3=\t\23\b9\t\21\3=\t\24\b9\t\21\3=\t\25\b9\t\26\3=\t\27\b9\t\26\3=\t\28\b9\t\26\3=\t\29\b9\t\30\3=\t\31\b9\t\30\3=\t \b9\t!\3=\t\"\b9\t!\3=\t#\b9\t!\3=\t$\b9\t\30\3=\t%\b9\t\14\3=\t&\b9\t\14\3=\t'\b9\t\14\3=\t(\b5\t)\0005\n*\0009\v+\0015\f1\0005\r-\0004\14\3\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14/\0=\0140\r=\r2\f>\f\0\v9\v+\0015\f7\0005\r5\0005\0144\0009\0153\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\0146\0=\0140\r=\r8\f>\f\1\v9\v+\0015\f;\0005\r9\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14:\0=\0140\r=\r<\f>\f\2\v9\v+\0015\fA\0005\r>\0009\14=\4=\14?\r4\14\3\0009\15@\5>\15\1\0149\15,\3>\15\2\14=\14.\r=\rB\f>\f\3\v9\v+\0015\fF\0005\rC\0009\14=\4=\14?\r5\14E\0009\15D\3>\15\1\0149\15,\3>\15\2\14=\14.\r=\rG\f>\f\4\v9\v+\0015\fJ\0005\rH\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14I\0=\0140\r=\rK\f>\f\5\v9\v+\0015\fO\0005\rM\0005\14L\0009\0153\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14N\0=\0140\r=\rP\f>\f\6\v9\v+\0015\fS\0005\rQ\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14R\0=\0140\r=\rT\f>\f\a\v9\v+\0015\fY\0005\rV\0009\14U\4=\14?\r5\14W\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14X\0=\0140\r=\rZ\f>\f\b\v9\v[\0015\f^\0005\r\\\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14]\0=\0140\r=\r_\f>\f\0\v9\v`\0015\fe\0005\rc\0005\14b\0009\15a\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14d\0=\0140\r=\rf\f>\f\0\v9\v`\0015\fj\0005\rh\0005\14g\0009\15\14\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14i\0=\0140\r=\rk\f>\f\1\v9\v`\0015\fo\0005\rm\0005\14l\0009\15\18\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14n\0=\0140\r=\rp\f>\f\2\v9\v`\0015\ft\0005\rr\0005\14q\0009\15\26\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14s\0=\0140\r=\ru\f>\f\3\v9\v`\0015\fy\0005\rw\0005\14v\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14x\0=\0140\r=\rz\f>\f\4\v9\v`\0015\f}\0005\r{\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14|\0=\0140\r=\r~\f>\f\5\v9\v`\0015\f‚\0005\r€\0005\14\0009\0153\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14\0=\0140\r=\rƒ\f>\f\6\v9\v`\0015\f†\0005\r„\0004\14\3\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14…\0=\0140\r=\r‡\f>\f\a\v9\vˆ\0015\fŒ\0005\rŠ\0004\14\3\0009\15\21\3>\15\1\0149\15‰\3>\15\2\14=\14.\r3\14‹\0=\0140\r=\r2\f>\f\0\v9\vˆ\0015\f\0005\rŽ\0005\14\0009\0153\3>\15\1\0149\15‰\3>\15\2\14=\14.\r3\14\0=\0140\r=\r8\f>\f\1\v9\vˆ\0015\f“\0005\r‘\0004\14\3\0009\15‰\3>\15\1\0149\15‰\3>\15\2\14=\14.\r3\14’\0=\0140\r=\r<\f>\f\2\v9\vˆ\0015\f•\0005\r”\0009\14=\4=\14?\r4\14\3\0009\15@\5>\15\1\0149\15‰\3>\15\2\14=\14.\r=\rB\f>\f\3\v9\vˆ\0015\f˜\0005\r—\0005\14–\0009\15D\3>\15\1\0149\15‰\3>\15\2\14=\14.\r=\rG\f>\f\4\v9\v™\0015\fœ\0005\rš\0004\14\3\0009\15‰\3>\15\1\0149\15‰\3>\15\2\14=\14.\r3\14›\0=\0140\r=\r~\f>\f\1\v9\v™\0015\f \0005\rž\0005\14\0009\0153\3>\15\1\0149\15‰\3>\15\2\14=\14.\r3\14Ÿ\0=\0140\r=\rƒ\f>\f\2\v9\v™\0015\f£\0005\r¡\0004\14\3\0009\15\21\3>\15\1\0149\15‰\3>\15\2\14=\14.\r3\14¢\0=\0140\r=\r‡\f>\f\3\v2\0\0€K\0\1\0\1\0\0\0\1\0\0\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\1\0\0\0\1\0\0\21short_line_right\1\0\0\1\0\1\rprovider\rFileName\1\4\0\0\0\0\tbold\1\0\0\1\0\1\rprovider\rFileIcon\1\0\0\0\1\0\0\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\1\0\0\0\1\0\0\abg\20short_line_left\nRight\1\0\0\0\1\0\0\rLineInfo\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\fLineSep\1\0\0\0\1\0\0\19DiagnosticInfo\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\19DiagnosticHint\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\19DiagnosticWarn\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\20DiagnosticError\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\14LspClient\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\afg\nright\nEmpty\1\0\0\0\1\0\0\bmid\bGit\1\0\0\0\1\4\0\0\0\0\tbold\1\0\0\24check_git_workspace\nEFSep\1\0\0\0\1\0\0\vFileEF\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\fFileSep\1\0\0\0\1\0\0\rFileName\1\0\0\1\4\0\0\0\0\tbold\nwhite\1\0\1\rprovider\rFileName\rFileIcon\1\0\0\24get_file_icon_color\14condition\1\0\1\rprovider\rFileIcon\21buffer_not_empty\vBufSep\1\0\0\0\1\0\0\fModeNum\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\nblack\tLeft\1\0\0\rprovider\0\14highlight\1\0\0\18bg_statusline\tleft\1\v\0\0\tâžŠ \tâ· \tâžŒ \tâž \tâžŽ \tâž \tâž \tâž‘ \tâž’ \tïª \1\0\18\aix\nðŸ…˜ \6n\nðŸ… \6c\nðŸ…’ \6t\nðŸ…£ \6i\nðŸ…˜ \aic\nðŸ…˜ \aRv\nðŸ…¡ \6!\nðŸ…’ \6s\nðŸ…¢ \6\22\nðŸ…¥ \6V\nðŸ…¥ \6S\nðŸ…¢ \6R\nðŸ…¡ \ar?\nðŸ…¡ \arm\nðŸ…¡ \6v\nðŸ…¥ \6r\nðŸ…¡ \6\19\nðŸ…¢ \6\22\6V\6v\6t\6\19\6S\6s\vorange\aRv\6R\vpurple\ar?\arm\6r\tcyan\bnoV\bnov\ano\6n\tblue\aix\aic\vyellow\6i\ngreen\6!\bred\6c\1\0\0\fmagenta\1\4\0\0\rNvimTree\thelp\vtagbar\20short_line_list\28galaxyline.provider_vcs\28galaxyline.provider_lsp!galaxyline.provider_fileinfo\25galaxyline.condition\1\0\r\tcyan\f#88C0D0\abg\f#4C566A\tblue\f#5E81AC\nblack\f#2E3440\vorange\f#D08770\18bg_statusline\f#4C566A\vpurple\f#B48EAD\nwhite\f#ECEFF4\ngreen\f#A3BE8C\fmagenta\f#8FBCBB\vyellow\f#EBCB8B\bred\f#BF616A\tgray\f#4b5263\31galaxyline.provider_buffer\fsection\15galaxyline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n·\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\15text_align\tleft\ttext\18File Explorer\rfiletype\rNvimTree\1\0\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
