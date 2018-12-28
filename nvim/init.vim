call plug#begin()
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'tell-k/vim-autopep8'
  Plug 'python-rope/ropevim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'neomake/neomake'
  Plug 'ncm2/ncm2' " completion manager
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-jedi'
  Plug 'ncm2/ncm2-go'
  Plug 'ncm2/ncm2-ultisnips'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

  set number
  set mouse=a
  set colorcolumn=80
  colorscheme nord
  tnoremap <Esc> <C-\><C-n>

  " linting
  let g:neomake_open_list = 2
  call neomake#configure#automake('rw')

  " completions
  set completeopt=noinsert,menuone,noselect
  autocmd BufEnter * call ncm2#enable_for_buffer()

  " gitgutter
  let g:gitgutter_realtime = 1
  set updatetime=50

  " NedTree Config
  autocmd vimenter * NERDTree
  autocmd VimEnter * wincmd p
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

