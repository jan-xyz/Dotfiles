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
    config = { "\27LJ\2\nw\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\b‚ñà\tmode\afn\25hi GalaxyLeft guifg=\17nvim_command\bapi\bvim”\1\0\0\a\4\t\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1-\0\1\0006\1\0\0009\1\4\0019\1\5\1B\1\1\0028\0\1\0-\1\2\0006\2\6\0009\2\a\2)\4\n\0-\5\3\0009\5\b\5B\5\1\0A\2\1\0028\1\2\1&\0\1\0L\0\2\0\b¿\t¿\n¿\2¿\22get_buffer_number\bmin\tmath\tmode\afn\28hi GalaxyModeNum guibg=\17nvim_command\bapi\bvim|\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\vÓÇæ‚ñà\tmode\afn\27hi GalaxyBufSep guibg=\17nvim_command\bapi\bvim{\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\tÓÇº \tmode\afn\28hi GalaxyFileSep guibg=\17nvim_command\bapi\bvim‡\1\0\0\t\2\n\0\0245\0\0\0-\1\0\0009\1\1\1B\1\1\2-\2\0\0009\2\2\2B\2\1\0026\3\3\0009\3\4\0039\3\5\3'\5\6\0-\6\1\0006\a\3\0009\a\a\a9\a\b\aB\a\1\0028\6\a\6&\5\6\5B\3\2\1\18\3\1\0'\4\t\0008\5\2\0&\3\5\3L\3\2\0\5¿\b¿\6 \tmode\afn\27hi GalaxyFileEF guibg=\17nvim_command\bapi\bvim\20get_file_format\20get_file_encode\1\0\3\bDOS\tÓò™ \tUNIX\tÓúí \bMAC\tÔåÇ {\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\vÓÇæ‚ñà\tmode\afn\26hi GalaxyEFSep guibg=\17nvim_command\bapi\bvim≤\1\0\0\6\2\n\0\0236\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1-\0\1\0009\0\6\0B\0\1\2\v\0\0\0X\1\1Ä'\0\a\0'\1\b\0\18\2\0\0'\3\t\0&\1\3\1L\1\2\0\b¿\a¿\6 \tÓú• \b???\19get_git_branch\tmode\afn\24hi GalaxyGit guifg=\17nvim_command\bapi\bvim\v\0\0\1\0\0\0\1K\0\1\0À\1\0\0\b\2\v\0\25'\0\0\0-\1\0\0009\1\1\1B\1\1\2\a\1\2\0X\2\2Ä'\0\3\0'\1\3\0006\2\4\0009\2\5\0029\2\6\2'\4\a\0-\5\1\0006\6\4\0009\6\b\0069\6\t\6B\6\1\0028\5\6\5&\4\5\4B\2\2\1\18\2\0\0\18\3\1\0'\4\n\0&\2\4\2L\2\2\0\6¿\b¿\6 \tmode\afn\30hi GalaxyLspClient guifg=\17nvim_command\bapi\bvim\5\18No Active Lsp\19get_lsp_client\tÔÇÖ z\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2ÄK\0\1\0X\2\5Ä\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \nError\14get_count\15diagnostic\blsp\bvim\tÔÅó \0|\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2ÄK\0\1\0X\2\5Ä\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \fWarning\14get_count\15diagnostic\blsp\bvim\tÔÅ± \0y\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2ÄK\0\1\0X\2\5Ä\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \tHint\14get_count\15diagnostic\blsp\bvim\tÔÅ™ \0Ä\1\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2ÄK\0\1\0X\2\5Ä\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \16Information\14get_count\15diagnostic\blsp\bvim\tÔÅö \0{\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\tÓÇº \tmode\afn\28hi GalaxyLineSep guibg=\17nvim_command\bapi\bvim‰\1\0\0\a\1\v\0\0296\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\0026\1\0\0009\1\1\0019\1\3\1'\3\4\0-\4\0\0006\5\0\0009\5\5\0059\5\6\5B\5\1\0028\4\5\4&\3\4\3B\1\2\1'\1\a\0:\2\1\0'\3\b\0006\4\0\0009\4\1\0049\4\t\4)\6\0\0B\4\2\2'\5\n\0:\6\2\0&\1\6\1L\1\2\0\b¿\6:\24nvim_buf_line_count\6/\t‚ò∞ \tmode\afn\29hi GalaxyLineInfo guibg=\17nvim_command\24nvim_win_get_cursor\bapi\bvimx\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\b‚ñà\tmode\afn\26hi GalaxyRight guifg=\17nvim_command\bapi\bvimw\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\b‚ñà\tmode\afn\25hi GalaxyLeft guifg=\17nvim_command\bapi\bvim”\1\0\0\a\4\t\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1-\0\1\0006\1\0\0009\1\4\0019\1\5\1B\1\1\0028\0\1\0-\1\2\0006\2\6\0009\2\a\2)\4\n\0-\5\3\0009\5\b\5B\5\1\0A\2\1\0028\1\2\1&\0\1\0L\0\2\0\b¿\t¿\n¿\2¿\22get_buffer_number\bmin\tmath\tmode\afn\28hi GalaxyModeNum guibg=\17nvim_command\bapi\bvim|\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\vÓÇæ‚ñà\tmode\afn\27hi GalaxyBufSep guibg=\17nvim_command\bapi\bvim{\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\tÓÇº \tmode\afn\28hi GalaxyLineSep guibg=\17nvim_command\bapi\bvim‰\1\0\0\a\1\v\0\0296\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\0026\1\0\0009\1\1\0019\1\3\1'\3\4\0-\4\0\0006\5\0\0009\5\5\0059\5\6\5B\5\1\0028\4\5\4&\3\4\3B\1\2\1'\1\a\0:\2\1\0'\3\b\0006\4\0\0009\4\1\0049\4\t\4)\6\0\0B\4\2\2'\5\n\0:\6\2\0&\1\6\1L\1\2\0\b¿\6:\24nvim_buf_line_count\6/\t‚ò∞ \tmode\afn\29hi GalaxyLineInfo guibg=\17nvim_command\24nvim_win_get_cursor\bapi\bvimx\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\b‚ñà\tmode\afn\26hi GalaxyRight guifg=\17nvim_command\bapi\bvimÏ\23\1\0\16\0§\1\0ó\0036\0\0\0'\2\1\0B\0\2\0029\1\2\0006\2\0\0'\4\3\0B\2\2\0025\3\4\0006\4\0\0'\6\5\0B\4\2\0026\5\0\0'\a\6\0B\5\2\0026\6\0\0'\b\a\0B\6\2\0026\a\0\0'\t\b\0B\a\2\0025\b\n\0=\b\t\0005\b\f\0009\t\v\3=\t\r\b9\t\14\3=\t\15\b9\t\16\3=\t\17\b9\t\18\3=\t\19\b9\t\18\3=\t\20\b9\t\21\3=\t\22\b9\t\21\3=\t\23\b9\t\21\3=\t\24\b9\t\21\3=\t\25\b9\t\26\3=\t\27\b9\t\26\3=\t\28\b9\t\26\3=\t\29\b9\t\30\3=\t\31\b9\t\30\3=\t \b9\t!\3=\t\"\b9\t!\3=\t#\b9\t!\3=\t$\b9\t\30\3=\t%\b9\t\14\3=\t&\b9\t\14\3=\t'\b9\t\14\3=\t(\b5\t)\0005\n*\0009\v+\0015\f1\0005\r-\0004\14\3\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14/\0=\0140\r=\r2\f>\f\0\v9\v+\0015\f7\0005\r5\0005\0144\0009\0153\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\0146\0=\0140\r=\r8\f>\f\1\v9\v+\0015\f;\0005\r9\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14:\0=\0140\r=\r<\f>\f\2\v9\v+\0015\fA\0005\r>\0009\14=\4=\14?\r4\14\3\0009\15@\5>\15\1\0149\15,\3>\15\2\14=\14.\r=\rB\f>\f\3\v9\v+\0015\fF\0005\rC\0009\14=\4=\14?\r5\14E\0009\15D\3>\15\1\0149\15,\3>\15\2\14=\14.\r=\rG\f>\f\4\v9\v+\0015\fJ\0005\rH\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14I\0=\0140\r=\rK\f>\f\5\v9\v+\0015\fO\0005\rM\0005\14L\0009\0153\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14N\0=\0140\r=\rP\f>\f\6\v9\v+\0015\fS\0005\rQ\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14R\0=\0140\r=\rT\f>\f\a\v9\v+\0015\fY\0005\rV\0009\14U\4=\14?\r5\14W\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14X\0=\0140\r=\rZ\f>\f\b\v9\v[\0015\f^\0005\r\\\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14]\0=\0140\r=\r_\f>\f\0\v9\v`\0015\fe\0005\rc\0005\14b\0009\15a\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14d\0=\0140\r=\rf\f>\f\0\v9\v`\0015\fj\0005\rh\0005\14g\0009\15\14\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14i\0=\0140\r=\rk\f>\f\1\v9\v`\0015\fo\0005\rm\0005\14l\0009\15\18\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14n\0=\0140\r=\rp\f>\f\2\v9\v`\0015\ft\0005\rr\0005\14q\0009\15\26\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14s\0=\0140\r=\ru\f>\f\3\v9\v`\0015\fy\0005\rw\0005\14v\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14x\0=\0140\r=\rz\f>\f\4\v9\v`\0015\f}\0005\r{\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14|\0=\0140\r=\r~\f>\f\5\v9\v`\0015\fÇ\0005\rÄ\0005\14\0009\0153\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14Å\0=\0140\r=\rÉ\f>\f\6\v9\v`\0015\fÜ\0005\rÑ\0004\14\3\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14Ö\0=\0140\r=\rá\f>\f\a\v9\và\0015\få\0005\rä\0004\14\3\0009\15\21\3>\15\1\0149\15â\3>\15\2\14=\14.\r3\14ã\0=\0140\r=\r2\f>\f\0\v9\và\0015\fê\0005\ré\0005\14ç\0009\0153\3>\15\1\0149\15â\3>\15\2\14=\14.\r3\14è\0=\0140\r=\r8\f>\f\1\v9\và\0015\fì\0005\rë\0004\14\3\0009\15â\3>\15\1\0149\15â\3>\15\2\14=\14.\r3\14í\0=\0140\r=\r<\f>\f\2\v9\và\0015\fï\0005\rî\0009\14=\4=\14?\r4\14\3\0009\15@\5>\15\1\0149\15â\3>\15\2\14=\14.\r=\rB\f>\f\3\v9\và\0015\fò\0005\ró\0005\14ñ\0009\15D\3>\15\1\0149\15â\3>\15\2\14=\14.\r=\rG\f>\f\4\v9\vô\0015\fú\0005\rö\0004\14\3\0009\15â\3>\15\1\0149\15â\3>\15\2\14=\14.\r3\14õ\0=\0140\r=\r~\f>\f\1\v9\vô\0015\f†\0005\rû\0005\14ù\0009\0153\3>\15\1\0149\15â\3>\15\2\14=\14.\r3\14ü\0=\0140\r=\rÉ\f>\f\2\v9\vô\0015\f£\0005\r°\0004\14\3\0009\15\21\3>\15\1\0149\15â\3>\15\2\14=\14.\r3\14¢\0=\0140\r=\rá\f>\f\3\v2\0\0ÄK\0\1\0\1\0\0\0\1\0\0\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\1\0\0\0\1\0\0\21short_line_right\1\0\0\1\0\1\rprovider\rFileName\1\4\0\0\0\0\tbold\1\0\0\1\0\1\rprovider\rFileIcon\1\0\0\0\1\0\0\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\1\0\0\0\1\0\0\abg\20short_line_left\nRight\1\0\0\0\1\0\0\rLineInfo\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\fLineSep\1\0\0\0\1\0\0\19DiagnosticInfo\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\19DiagnosticHint\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\19DiagnosticWarn\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\20DiagnosticError\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\14LspClient\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\afg\nright\nEmpty\1\0\0\0\1\0\0\bmid\bGit\1\0\0\0\1\4\0\0\0\0\tbold\1\0\0\24check_git_workspace\nEFSep\1\0\0\0\1\0\0\vFileEF\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\fFileSep\1\0\0\0\1\0\0\rFileName\1\0\0\1\4\0\0\0\0\tbold\nwhite\1\0\1\rprovider\rFileName\rFileIcon\1\0\0\24get_file_icon_color\14condition\1\0\1\rprovider\rFileIcon\21buffer_not_empty\vBufSep\1\0\0\0\1\0\0\fModeNum\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\nblack\tLeft\1\0\0\rprovider\0\14highlight\1\0\0\18bg_statusline\tleft\1\v\0\0\t‚ûä \t‚ù∑ \t‚ûå \t‚ûç \t‚ûé \t‚ûè \t‚ûê \t‚ûë \t‚ûí \tÔÅ™ \1\0\18\6r\nüÖ° \6s\nüÖ¢ \6\19\nüÖ¢ \aic\nüÖò \6\22\nüÖ• \6c\nüÖí \6t\nüÖ£ \6R\nüÖ° \6V\nüÖ• \6S\nüÖ¢ \aRv\nüÖ° \ar?\nüÖ° \arm\nüÖ° \6v\nüÖ• \6n\nüÖù \aix\nüÖò \6i\nüÖò \6!\nüÖí \6\22\6V\6v\6t\6\19\6S\6s\vorange\aRv\6R\vpurple\ar?\arm\6r\tcyan\bnoV\bnov\ano\6n\tblue\aix\aic\vyellow\6i\ngreen\6!\bred\6c\1\0\0\fmagenta\1\4\0\0\rNvimTree\thelp\vtagbar\20short_line_list\28galaxyline.provider_vcs\28galaxyline.provider_lsp!galaxyline.provider_fileinfo\25galaxyline.condition\1\0\r\tblue\f#5E81AC\fmagenta\f#8FBCBB\vorange\f#D08770\nblack\f#2E3440\vpurple\f#B48EAD\18bg_statusline\f#4C566A\ngreen\f#A3BE8C\nwhite\f#ECEFF4\vyellow\f#EBCB8B\bred\f#BF616A\tgray\f#4b5263\tcyan\f#88C0D0\abg\f#4C566A\31galaxyline.provider_buffer\fsection\15galaxyline\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nï\2\0\0\6\0\14\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\1\5\0005\3\v\0005\4\6\0005\5\a\0=\5\b\0045\5\t\0=\5\n\4=\4\f\0035\4\r\0B\1\3\1K\0\1\0\1\0\2\tmode\6n\vprefix\r<leader>\6g\1\0\0\6d\1\3\1\0\30<cmd>Gitsign diffthis<CR>\tDiff\fnoremap\2\6b\1\3\1\0 <cmd>Gitsign blame_line<CR>\nBlame\fnoremap\2\1\0\1\tname\bGit\rregister\14which-key\1\0\1\nnumhl\2\nsetup\rgitsigns\frequire\0" },
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
    config = { "\27LJ\2\nË\1\0\0\6\0\f\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\1\5\0005\3\t\0005\4\6\0005\5\a\0=\5\b\4=\4\n\0035\4\v\0B\1\3\1K\0\1\0\1\0\2\tmode\6n\vprefix\r<leader>\6g\1\0\0\6n\1\3\1\0\20<cmd>Neogit<CR>\vNeogit\fnoremap\2\1\0\1\tname\bGit\rregister\14which-key\1\0\1 disable_commit_confirmation\2\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nord-vim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\21colorscheme nord\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n∑\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\15text_align\tleft\ttext\18File Explorer\rfiletype\rNvimTree\1\0\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0" },
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
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n\t\0\0\6\0%\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\1\4\0005\3\26\0005\4\5\0005\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\0045\5\16\0=\5\17\0045\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\4=\4\27\0035\4\28\0B\1\3\0019\1\4\0005\3\30\0005\4\29\0=\4\t\0035\4\31\0B\1\3\0016\1 \0009\1!\1'\3\"\0B\1\2\0016\1\0\0'\3#\0B\1\2\0029\1$\1B\1\1\1K\0\1\0\18load_launchjs\19dap.ext.vscodeHautocmd FileType dap-repl lua require('dap.ext.autocompl').attach()\bcmd\bvim\1\0\2\tmode\6v\vprefix\r<leader>\1\0\0\1\3\1\0)<cmd>lua require'dap'.continue()<CR>\19Start/continue\fnoremap\2\1\0\2\tmode\6n\vprefix\r<leader>\6d\1\0\0\6l\1\3\1\0001<cmd>lua require'dap'.list_breakpoints()<CR>\21List breakpoints\fnoremap\2\6e\1\3\1\0U<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR> set conditional break point\fnoremap\2\6p\1\3\1\0\\<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>\18Set log point\fnoremap\2\6t\1\3\1\0)<cmd>lua require'dapui'.toggle()<CR>\14Toggle UI\fnoremap\2\6r\1\3\1\0*<cmd>lua require'dap'.repl.open()<CR>\tREPL\fnoremap\2\6o\1\3\1\0*<cmd>lua require'dap'.step_over()<CR>\14Step over\fnoremap\2\6u\1\3\1\0)<cmd>lua require'dap'.step_out()<CR>\rStep out\fnoremap\2\6i\1\3\1\0*<cmd>lua require'dap'.step_into()<CR>\14Step into\fnoremap\2\6c\1\3\1\0)<cmd>lua require'dap'.continue()<CR>\19Start/continue\fnoremap\2\6b\1\3\1\0002<cmd>lua require'dap'.toggle_breakpoint()<CR>\22Toggle breakpoint\fnoremap\2\1\0\1\tname\rDebugger\rregister\14which-key\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\21dap_virtual_text\6g\bvim\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nÚ\2\0\0\3\0\14\0(6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0016\0\0\0'\2\5\0B\0\2\0016\0\0\0'\2\6\0B\0\2\0016\0\0\0'\2\a\0B\0\2\0016\0\0\0'\2\b\0B\0\2\0016\0\0\0'\2\t\0B\0\2\0016\0\0\0'\2\n\0B\0\2\0016\0\0\0'\2\v\0B\0\2\0016\0\0\0'\2\f\0B\0\2\0016\0\0\0'\2\r\0B\0\2\1K\0\1\0\19languages.yaml\18languages.vim\20languages.scala\19languages.rust\16languages.r\21languages.python\19languages.misc\18languages.lua\21languages.kotlin\20languages.julia\17languages.go\21languages.docker\18languages.cpp\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÙ\2\0\0\5\0\f\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\1\5\0005\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0B\1\3\1K\0\1\0\1\0\1\vprefix\6t\6f\1\3\1\0\30<cmd>NvimTreeFindFile<CR>\31Find file in file explorer\fnoremap\2\6e\1\0\0\1\3\1\0\28<cmd>NvimTreeToggle<CR>\25Toggle file explorer\fnoremap\2\rregister\14which-key\1\0\a\17hijack_netrw\3\0\18disable_netrw\3\0\20lsp_diagnostics\3\1\17add_trailing\3\1\17quit_on_open\3\0\15auto_close\3\0\14auto_open\3\1\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÖ\1\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
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
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\ní\5\0\0\6\0\18\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\16\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\4=\4\5\0035\4\17\0B\1\3\1K\0\1\0\1\0\1\vprefix\r<leader>\1\0\0\6b\1\3\1\0008<cmd>lua require('telescope.builtin').buffers()<cr>\22List open buffers\fnoremap\2\6p\1\3\1\0008<cmd>lua require('telescope.builtin').pickers()<cr>\21List all pickers\fnoremap\2\6r\1\3\1\0007<cmd>lua require('telescope.builtin').resume()<cr>\23Resume last picker\fnoremap\2\6o\1\3\1\0009<cmd>lua require('telescope.builtin').oldfiles()<cr>\21Open Recent File\fnoremap\2\6g\1\3\1\0:<cmd>lua require('telescope.builtin').live_grep()<cr>\17Find in File\fnoremap\2\6f\1\3\1\0;<cmd>lua require('telescope.builtin').find_files()<cr>\14Find File\fnoremap\2\1\0\1\tname\tFile\rregister\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\nÅ\2\0\0\5\0\n\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0B\1\3\0019\1\2\0005\3\b\0005\4\a\0=\4\5\0035\4\t\0B\1\3\1K\0\1\0\1\0\2\tmode\6t\vprefix\r<leader>\1\0\0\1\3\1\0\28<cmd>FloatermToggle<CR>\20Toggle terminal\fnoremap\2\1\0\1\vprefix\r<leader>\6t\1\0\0\1\3\1\0\28<cmd>FloatermToggle<CR>\20Toggle terminal\fnoremap\2\rregister\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-sanegx"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vim-sanegx"
  },
  ["vista.vim"] = {
    config = { "\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rnvim_lsp\28vista_default_executive\6g\bvim\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n∞\1\0\0\6\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0B\1\3\1K\0\1\0\1\0\2\tmode\6n\vprefix\r<leader>\6b\1\0\0\6d\1\3\1\0\16<cmd>bd<CR>\vdelete\fnoremap\2\1\0\1\tname\vbuffer\rregister\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\ní\5\0\0\6\0\18\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\16\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\4=\4\5\0035\4\17\0B\1\3\1K\0\1\0\1\0\1\vprefix\r<leader>\1\0\0\6b\1\3\1\0008<cmd>lua require('telescope.builtin').buffers()<cr>\22List open buffers\fnoremap\2\6p\1\3\1\0008<cmd>lua require('telescope.builtin').pickers()<cr>\21List all pickers\fnoremap\2\6r\1\3\1\0007<cmd>lua require('telescope.builtin').resume()<cr>\23Resume last picker\fnoremap\2\6o\1\3\1\0009<cmd>lua require('telescope.builtin').oldfiles()<cr>\21Open Recent File\fnoremap\2\6g\1\3\1\0:<cmd>lua require('telescope.builtin').live_grep()<cr>\17Find in File\fnoremap\2\6f\1\3\1\0;<cmd>lua require('telescope.builtin').find_files()<cr>\14Find File\fnoremap\2\1\0\1\tname\tFile\rregister\14which-key\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: vista.vim
time([[Config for vista.vim]], true)
try_loadstring("\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rnvim_lsp\28vista_default_executive\6g\bvim\0", "config", "vista.vim")
time([[Config for vista.vim]], false)
-- Config for: nvim-dap-virtual-text
time([[Config for nvim-dap-virtual-text]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\21dap_virtual_text\6g\bvim\0", "config", "nvim-dap-virtual-text")
time([[Config for nvim-dap-virtual-text]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n∞\1\0\0\6\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0B\1\3\1K\0\1\0\1\0\2\tmode\6n\vprefix\r<leader>\6b\1\0\0\6d\1\3\1\0\16<cmd>bd<CR>\vdelete\fnoremap\2\1\0\1\tname\vbuffer\rregister\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nÚ\2\0\0\3\0\14\0(6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0016\0\0\0'\2\5\0B\0\2\0016\0\0\0'\2\6\0B\0\2\0016\0\0\0'\2\a\0B\0\2\0016\0\0\0'\2\b\0B\0\2\0016\0\0\0'\2\t\0B\0\2\0016\0\0\0'\2\n\0B\0\2\0016\0\0\0'\2\v\0B\0\2\0016\0\0\0'\2\f\0B\0\2\0016\0\0\0'\2\r\0B\0\2\1K\0\1\0\19languages.yaml\18languages.vim\20languages.scala\19languages.rust\16languages.r\21languages.python\19languages.misc\18languages.lua\21languages.kotlin\20languages.julia\17languages.go\21languages.docker\18languages.cpp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\nw\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\b‚ñà\tmode\afn\25hi GalaxyLeft guifg=\17nvim_command\bapi\bvim”\1\0\0\a\4\t\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1-\0\1\0006\1\0\0009\1\4\0019\1\5\1B\1\1\0028\0\1\0-\1\2\0006\2\6\0009\2\a\2)\4\n\0-\5\3\0009\5\b\5B\5\1\0A\2\1\0028\1\2\1&\0\1\0L\0\2\0\b¿\t¿\n¿\2¿\22get_buffer_number\bmin\tmath\tmode\afn\28hi GalaxyModeNum guibg=\17nvim_command\bapi\bvim|\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\vÓÇæ‚ñà\tmode\afn\27hi GalaxyBufSep guibg=\17nvim_command\bapi\bvim{\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\tÓÇº \tmode\afn\28hi GalaxyFileSep guibg=\17nvim_command\bapi\bvim‡\1\0\0\t\2\n\0\0245\0\0\0-\1\0\0009\1\1\1B\1\1\2-\2\0\0009\2\2\2B\2\1\0026\3\3\0009\3\4\0039\3\5\3'\5\6\0-\6\1\0006\a\3\0009\a\a\a9\a\b\aB\a\1\0028\6\a\6&\5\6\5B\3\2\1\18\3\1\0'\4\t\0008\5\2\0&\3\5\3L\3\2\0\5¿\b¿\6 \tmode\afn\27hi GalaxyFileEF guibg=\17nvim_command\bapi\bvim\20get_file_format\20get_file_encode\1\0\3\bDOS\tÓò™ \tUNIX\tÓúí \bMAC\tÔåÇ {\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\vÓÇæ‚ñà\tmode\afn\26hi GalaxyEFSep guibg=\17nvim_command\bapi\bvim≤\1\0\0\6\2\n\0\0236\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1-\0\1\0009\0\6\0B\0\1\2\v\0\0\0X\1\1Ä'\0\a\0'\1\b\0\18\2\0\0'\3\t\0&\1\3\1L\1\2\0\b¿\a¿\6 \tÓú• \b???\19get_git_branch\tmode\afn\24hi GalaxyGit guifg=\17nvim_command\bapi\bvim\v\0\0\1\0\0\0\1K\0\1\0À\1\0\0\b\2\v\0\25'\0\0\0-\1\0\0009\1\1\1B\1\1\2\a\1\2\0X\2\2Ä'\0\3\0'\1\3\0006\2\4\0009\2\5\0029\2\6\2'\4\a\0-\5\1\0006\6\4\0009\6\b\0069\6\t\6B\6\1\0028\5\6\5&\4\5\4B\2\2\1\18\2\0\0\18\3\1\0'\4\n\0&\2\4\2L\2\2\0\6¿\b¿\6 \tmode\afn\30hi GalaxyLspClient guifg=\17nvim_command\bapi\bvim\5\18No Active Lsp\19get_lsp_client\tÔÇÖ z\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2ÄK\0\1\0X\2\5Ä\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \nError\14get_count\15diagnostic\blsp\bvim\tÔÅó \0|\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2ÄK\0\1\0X\2\5Ä\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \fWarning\14get_count\15diagnostic\blsp\bvim\tÔÅ± \0y\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2ÄK\0\1\0X\2\5Ä\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \tHint\14get_count\15diagnostic\blsp\bvim\tÔÅ™ \0Ä\1\0\0\5\0\a\1\18'\0\0\0006\1\1\0009\1\2\0019\1\3\0019\1\4\1)\3\0\0'\4\5\0B\1\3\2\t\1\0\0X\2\2ÄK\0\1\0X\2\5Ä\18\2\0\0\18\3\1\0'\4\6\0&\2\4\2L\2\2\0K\0\1\0\6 \16Information\14get_count\15diagnostic\blsp\bvim\tÔÅö \0{\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\tÓÇº \tmode\afn\28hi GalaxyLineSep guibg=\17nvim_command\bapi\bvim‰\1\0\0\a\1\v\0\0296\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\0026\1\0\0009\1\1\0019\1\3\1'\3\4\0-\4\0\0006\5\0\0009\5\5\0059\5\6\5B\5\1\0028\4\5\4&\3\4\3B\1\2\1'\1\a\0:\2\1\0'\3\b\0006\4\0\0009\4\1\0049\4\t\4)\6\0\0B\4\2\2'\5\n\0:\6\2\0&\1\6\1L\1\2\0\b¿\6:\24nvim_buf_line_count\6/\t‚ò∞ \tmode\afn\29hi GalaxyLineInfo guibg=\17nvim_command\24nvim_win_get_cursor\bapi\bvimx\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\b‚ñà\tmode\afn\26hi GalaxyRight guifg=\17nvim_command\bapi\bvimw\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\b‚ñà\tmode\afn\25hi GalaxyLeft guifg=\17nvim_command\bapi\bvim”\1\0\0\a\4\t\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1-\0\1\0006\1\0\0009\1\4\0019\1\5\1B\1\1\0028\0\1\0-\1\2\0006\2\6\0009\2\a\2)\4\n\0-\5\3\0009\5\b\5B\5\1\0A\2\1\0028\1\2\1&\0\1\0L\0\2\0\b¿\t¿\n¿\2¿\22get_buffer_number\bmin\tmath\tmode\afn\28hi GalaxyModeNum guibg=\17nvim_command\bapi\bvim|\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\vÓÇæ‚ñà\tmode\afn\27hi GalaxyBufSep guibg=\17nvim_command\bapi\bvim{\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\tÓÇº \tmode\afn\28hi GalaxyLineSep guibg=\17nvim_command\bapi\bvim‰\1\0\0\a\1\v\0\0296\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\0026\1\0\0009\1\1\0019\1\3\1'\3\4\0-\4\0\0006\5\0\0009\5\5\0059\5\6\5B\5\1\0028\4\5\4&\3\4\3B\1\2\1'\1\a\0:\2\1\0'\3\b\0006\4\0\0009\4\1\0049\4\t\4)\6\0\0B\4\2\2'\5\n\0:\6\2\0&\1\6\1L\1\2\0\b¿\6:\24nvim_buf_line_count\6/\t‚ò∞ \tmode\afn\29hi GalaxyLineInfo guibg=\17nvim_command\24nvim_win_get_cursor\bapi\bvimx\0\0\6\1\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0-\3\0\0006\4\0\0009\4\4\0049\4\5\4B\4\1\0028\3\4\3&\2\3\2B\0\2\1'\0\6\0L\0\2\0\b¿\b‚ñà\tmode\afn\26hi GalaxyRight guifg=\17nvim_command\bapi\bvimÏ\23\1\0\16\0§\1\0ó\0036\0\0\0'\2\1\0B\0\2\0029\1\2\0006\2\0\0'\4\3\0B\2\2\0025\3\4\0006\4\0\0'\6\5\0B\4\2\0026\5\0\0'\a\6\0B\5\2\0026\6\0\0'\b\a\0B\6\2\0026\a\0\0'\t\b\0B\a\2\0025\b\n\0=\b\t\0005\b\f\0009\t\v\3=\t\r\b9\t\14\3=\t\15\b9\t\16\3=\t\17\b9\t\18\3=\t\19\b9\t\18\3=\t\20\b9\t\21\3=\t\22\b9\t\21\3=\t\23\b9\t\21\3=\t\24\b9\t\21\3=\t\25\b9\t\26\3=\t\27\b9\t\26\3=\t\28\b9\t\26\3=\t\29\b9\t\30\3=\t\31\b9\t\30\3=\t \b9\t!\3=\t\"\b9\t!\3=\t#\b9\t!\3=\t$\b9\t\30\3=\t%\b9\t\14\3=\t&\b9\t\14\3=\t'\b9\t\14\3=\t(\b5\t)\0005\n*\0009\v+\0015\f1\0005\r-\0004\14\3\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14/\0=\0140\r=\r2\f>\f\0\v9\v+\0015\f7\0005\r5\0005\0144\0009\0153\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\0146\0=\0140\r=\r8\f>\f\1\v9\v+\0015\f;\0005\r9\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14:\0=\0140\r=\r<\f>\f\2\v9\v+\0015\fA\0005\r>\0009\14=\4=\14?\r4\14\3\0009\15@\5>\15\1\0149\15,\3>\15\2\14=\14.\r=\rB\f>\f\3\v9\v+\0015\fF\0005\rC\0009\14=\4=\14?\r5\14E\0009\15D\3>\15\1\0149\15,\3>\15\2\14=\14.\r=\rG\f>\f\4\v9\v+\0015\fJ\0005\rH\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14I\0=\0140\r=\rK\f>\f\5\v9\v+\0015\fO\0005\rM\0005\14L\0009\0153\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14N\0=\0140\r=\rP\f>\f\6\v9\v+\0015\fS\0005\rQ\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14R\0=\0140\r=\rT\f>\f\a\v9\v+\0015\fY\0005\rV\0009\14U\4=\14?\r5\14W\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14X\0=\0140\r=\rZ\f>\f\b\v9\v[\0015\f^\0005\r\\\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14]\0=\0140\r=\r_\f>\f\0\v9\v`\0015\fe\0005\rc\0005\14b\0009\15a\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14d\0=\0140\r=\rf\f>\f\0\v9\v`\0015\fj\0005\rh\0005\14g\0009\15\14\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14i\0=\0140\r=\rk\f>\f\1\v9\v`\0015\fo\0005\rm\0005\14l\0009\15\18\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14n\0=\0140\r=\rp\f>\f\2\v9\v`\0015\ft\0005\rr\0005\14q\0009\15\26\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14s\0=\0140\r=\ru\f>\f\3\v9\v`\0015\fy\0005\rw\0005\14v\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14x\0=\0140\r=\rz\f>\f\4\v9\v`\0015\f}\0005\r{\0004\14\3\0009\15,\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14|\0=\0140\r=\r~\f>\f\5\v9\v`\0015\fÇ\0005\rÄ\0005\14\0009\0153\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14Å\0=\0140\r=\rÉ\f>\f\6\v9\v`\0015\fÜ\0005\rÑ\0004\14\3\0009\15\21\3>\15\1\0149\15,\3>\15\2\14=\14.\r3\14Ö\0=\0140\r=\rá\f>\f\a\v9\và\0015\få\0005\rä\0004\14\3\0009\15\21\3>\15\1\0149\15â\3>\15\2\14=\14.\r3\14ã\0=\0140\r=\r2\f>\f\0\v9\và\0015\fê\0005\ré\0005\14ç\0009\0153\3>\15\1\0149\15â\3>\15\2\14=\14.\r3\14è\0=\0140\r=\r8\f>\f\1\v9\và\0015\fì\0005\rë\0004\14\3\0009\15â\3>\15\1\0149\15â\3>\15\2\14=\14.\r3\14í\0=\0140\r=\r<\f>\f\2\v9\và\0015\fï\0005\rî\0009\14=\4=\14?\r4\14\3\0009\15@\5>\15\1\0149\15â\3>\15\2\14=\14.\r=\rB\f>\f\3\v9\và\0015\fò\0005\ró\0005\14ñ\0009\15D\3>\15\1\0149\15â\3>\15\2\14=\14.\r=\rG\f>\f\4\v9\vô\0015\fú\0005\rö\0004\14\3\0009\15â\3>\15\1\0149\15â\3>\15\2\14=\14.\r3\14õ\0=\0140\r=\r~\f>\f\1\v9\vô\0015\f†\0005\rû\0005\14ù\0009\0153\3>\15\1\0149\15â\3>\15\2\14=\14.\r3\14ü\0=\0140\r=\rÉ\f>\f\2\v9\vô\0015\f£\0005\r°\0004\14\3\0009\15\21\3>\15\1\0149\15â\3>\15\2\14=\14.\r3\14¢\0=\0140\r=\rá\f>\f\3\v2\0\0ÄK\0\1\0\1\0\0\0\1\0\0\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\1\0\0\0\1\0\0\21short_line_right\1\0\0\1\0\1\rprovider\rFileName\1\4\0\0\0\0\tbold\1\0\0\1\0\1\rprovider\rFileIcon\1\0\0\0\1\0\0\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\1\0\0\0\1\0\0\abg\20short_line_left\nRight\1\0\0\0\1\0\0\rLineInfo\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\fLineSep\1\0\0\0\1\0\0\19DiagnosticInfo\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\19DiagnosticHint\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\19DiagnosticWarn\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\20DiagnosticError\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\14LspClient\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\afg\nright\nEmpty\1\0\0\0\1\0\0\bmid\bGit\1\0\0\0\1\4\0\0\0\0\tbold\1\0\0\24check_git_workspace\nEFSep\1\0\0\0\1\0\0\vFileEF\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\fFileSep\1\0\0\0\1\0\0\rFileName\1\0\0\1\4\0\0\0\0\tbold\nwhite\1\0\1\rprovider\rFileName\rFileIcon\1\0\0\24get_file_icon_color\14condition\1\0\1\rprovider\rFileIcon\21buffer_not_empty\vBufSep\1\0\0\0\1\0\0\fModeNum\1\0\0\0\1\0\0\1\4\0\0\0\0\tbold\nblack\tLeft\1\0\0\rprovider\0\14highlight\1\0\0\18bg_statusline\tleft\1\v\0\0\t‚ûä \t‚ù∑ \t‚ûå \t‚ûç \t‚ûé \t‚ûè \t‚ûê \t‚ûë \t‚ûí \tÔÅ™ \1\0\18\6r\nüÖ° \6s\nüÖ¢ \6\19\nüÖ¢ \aic\nüÖò \6\22\nüÖ• \6c\nüÖí \6t\nüÖ£ \6R\nüÖ° \6V\nüÖ• \6S\nüÖ¢ \aRv\nüÖ° \ar?\nüÖ° \arm\nüÖ° \6v\nüÖ• \6n\nüÖù \aix\nüÖò \6i\nüÖò \6!\nüÖí \6\22\6V\6v\6t\6\19\6S\6s\vorange\aRv\6R\vpurple\ar?\arm\6r\tcyan\bnoV\bnov\ano\6n\tblue\aix\aic\vyellow\6i\ngreen\6!\bred\6c\1\0\0\fmagenta\1\4\0\0\rNvimTree\thelp\vtagbar\20short_line_list\28galaxyline.provider_vcs\28galaxyline.provider_lsp!galaxyline.provider_fileinfo\25galaxyline.condition\1\0\r\tblue\f#5E81AC\fmagenta\f#8FBCBB\vorange\f#D08770\nblack\f#2E3440\vpurple\f#B48EAD\18bg_statusline\f#4C566A\ngreen\f#A3BE8C\nwhite\f#ECEFF4\vyellow\f#EBCB8B\bred\f#BF616A\tgray\f#4b5263\tcyan\f#88C0D0\abg\f#4C566A\31galaxyline.provider_buffer\fsection\15galaxyline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n∑\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\15text_align\tleft\ttext\18File Explorer\rfiletype\rNvimTree\1\0\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÙ\2\0\0\5\0\f\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\1\5\0005\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0B\1\3\1K\0\1\0\1\0\1\vprefix\6t\6f\1\3\1\0\30<cmd>NvimTreeFindFile<CR>\31Find file in file explorer\fnoremap\2\6e\1\0\0\1\3\1\0\28<cmd>NvimTreeToggle<CR>\25Toggle file explorer\fnoremap\2\rregister\14which-key\1\0\a\17hijack_netrw\3\0\18disable_netrw\3\0\20lsp_diagnostics\3\1\17add_trailing\3\1\17quit_on_open\3\0\15auto_close\3\0\14auto_open\3\1\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nï\2\0\0\6\0\14\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\1\5\0005\3\v\0005\4\6\0005\5\a\0=\5\b\0045\5\t\0=\5\n\4=\4\f\0035\4\r\0B\1\3\1K\0\1\0\1\0\2\tmode\6n\vprefix\r<leader>\6g\1\0\0\6d\1\3\1\0\30<cmd>Gitsign diffthis<CR>\tDiff\fnoremap\2\6b\1\3\1\0 <cmd>Gitsign blame_line<CR>\nBlame\fnoremap\2\1\0\1\tname\bGit\rregister\14which-key\1\0\1\nnumhl\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\nË\1\0\0\6\0\f\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\1\5\0005\3\t\0005\4\6\0005\5\a\0=\5\b\4=\4\n\0035\4\v\0B\1\3\1K\0\1\0\1\0\2\tmode\6n\vprefix\r<leader>\6g\1\0\0\6n\1\3\1\0\20<cmd>Neogit<CR>\vNeogit\fnoremap\2\1\0\1\tname\bGit\rregister\14which-key\1\0\1 disable_commit_confirmation\2\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÖ\1\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\nÅ\2\0\0\5\0\n\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0B\1\3\0019\1\2\0005\3\b\0005\4\a\0=\4\5\0035\4\t\0B\1\3\1K\0\1\0\1\0\2\tmode\6t\vprefix\r<leader>\1\0\0\1\3\1\0\28<cmd>FloatermToggle<CR>\20Toggle terminal\fnoremap\2\1\0\1\vprefix\r<leader>\6t\1\0\0\1\3\1\0\28<cmd>FloatermToggle<CR>\20Toggle terminal\fnoremap\2\rregister\14which-key\frequire\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: telescope-dap.nvim
time([[Config for telescope-dap.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0", "config", "telescope-dap.nvim")
time([[Config for telescope-dap.nvim]], false)
-- Config for: nord-vim
time([[Config for nord-vim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\21colorscheme nord\bcmd\bvim\0", "config", "nord-vim")
time([[Config for nord-vim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n\t\0\0\6\0%\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\1\4\0005\3\26\0005\4\5\0005\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\0045\5\16\0=\5\17\0045\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\4=\4\27\0035\4\28\0B\1\3\0019\1\4\0005\3\30\0005\4\29\0=\4\t\0035\4\31\0B\1\3\0016\1 \0009\1!\1'\3\"\0B\1\2\0016\1\0\0'\3#\0B\1\2\0029\1$\1B\1\1\1K\0\1\0\18load_launchjs\19dap.ext.vscodeHautocmd FileType dap-repl lua require('dap.ext.autocompl').attach()\bcmd\bvim\1\0\2\tmode\6v\vprefix\r<leader>\1\0\0\1\3\1\0)<cmd>lua require'dap'.continue()<CR>\19Start/continue\fnoremap\2\1\0\2\tmode\6n\vprefix\r<leader>\6d\1\0\0\6l\1\3\1\0001<cmd>lua require'dap'.list_breakpoints()<CR>\21List breakpoints\fnoremap\2\6e\1\3\1\0U<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR> set conditional break point\fnoremap\2\6p\1\3\1\0\\<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>\18Set log point\fnoremap\2\6t\1\3\1\0)<cmd>lua require'dapui'.toggle()<CR>\14Toggle UI\fnoremap\2\6r\1\3\1\0*<cmd>lua require'dap'.repl.open()<CR>\tREPL\fnoremap\2\6o\1\3\1\0*<cmd>lua require'dap'.step_over()<CR>\14Step over\fnoremap\2\6u\1\3\1\0)<cmd>lua require'dap'.step_out()<CR>\rStep out\fnoremap\2\6i\1\3\1\0*<cmd>lua require'dap'.step_into()<CR>\14Step into\fnoremap\2\6c\1\3\1\0)<cmd>lua require'dap'.continue()<CR>\19Start/continue\fnoremap\2\6b\1\3\1\0002<cmd>lua require'dap'.toggle_breakpoint()<CR>\22Toggle breakpoint\fnoremap\2\1\0\1\tname\rDebugger\rregister\14which-key\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
