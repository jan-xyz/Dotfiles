return require('packer').startup(function(use)
  -- Window Add-Ons
  use 'vim-airline/vim-airline'
  use { 'arcticicestudio/nord-vim', branch= 'develop' }
  use 'majutsushi/tagbar'
  use 'liuchengxu/vista.vim'
  use {'kyazdani42/nvim-tree.lua', requires ='kyazdani42/nvim-web-devicons'}
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use {'akinsho/nvim-toggleterm.lua'}

  -- Misc
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install()'](0) end }
  use 'junegunn/fzf.vim'

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
end)
