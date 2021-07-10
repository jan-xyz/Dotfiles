return require('packer').startup({function(use)
  -- UX
  use { 'famiu/nvim-reload',  requires='nvim-lua/plenary.nvim' }
  use 'nvim-lua/lsp_extensions.nvim'

  -- Window Add-Ons
  use { 'arcticicestudio/nord-vim', branch= 'develop' }
  use 'majutsushi/tagbar'
  use 'liuchengxu/vista.vim'
  use 'voldikss/vim-floaterm'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'hoob3rt/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}

  -- Git support
  use 'airblade/vim-gitgutter'
  use 'kristijanhusak/defx-git'
  use 'tpope/vim-fugitive'

  -- autocompletion and linting
  use 'neovim/nvim-lspconfig'
  use 'bufbuild/vim-buf'
  use 'dense-analysis/ale'
  use 'nvim-lua/completion-nvim'

  -- Snippet support
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- language specific support
  use 'udalov/kotlin-vim'
  use 'sebdah/vim-delve'
  use 'folke/lua-dev.nvim'

end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})
