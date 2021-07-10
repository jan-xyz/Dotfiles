return require('packer').startup({function(use)
  -- UX
  use { 'famiu/nvim-reload',  requires='nvim-lua/plenary.nvim' }
  use 'nvim-lua/lsp_extensions.nvim'
  use 'neovim/nvim-lspconfig'

  -- Debugger
  use 'mfussenegger/nvim-dap'
  use {'theHamsta/nvim-dap-virtual-text', requires = {'mfussenegger/nvim-dap'}}
  use {'nvim-telescope/telescope-dap.nvim', requires = {{'mfussenegger/nvim-dap'}, {'nvim-telescope/telescope.nvim'}}}

  -- Window Add-Ons
  use { 'arcticicestudio/nord-vim', branch= 'develop' }
  use 'majutsushi/tagbar'
  use 'liuchengxu/vista.vim'
  use 'voldikss/vim-floaterm'
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'hoob3rt/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}

  -- Git support
  use 'airblade/vim-gitgutter'
  use 'kristijanhusak/defx-git'
  use 'tpope/vim-fugitive'

  -- autocompletion and linting
  use 'bufbuild/vim-buf'
  use 'dense-analysis/ale'
  use 'nvim-lua/completion-nvim'

  -- Snippet support
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- language specific support
  use 'udalov/kotlin-vim'
  use 'folke/lua-dev.nvim'

end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})
