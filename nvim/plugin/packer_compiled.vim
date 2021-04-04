" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/jan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/jan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/jan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/jan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/jan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ale = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["defx-git"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/defx-git"
  },
  fzf = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["kotlin-vim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/kotlin-vim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
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
  tagbar = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-buf"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vim-buf"
  },
  ["vim-delve"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vim-delve"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/Users/jan/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
