call plug#begin()
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'tell-k/vim-autopep8'
  Plug 'python-rope/ropevim'

  set number
  set mouse=a
  set colorcolumn=80

  " linting
  Plug 'neomake/neomake'
  let g:neomake_open_list = 2

  " completions
  Plug 'ncm2/ncm2' " completion manager
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-jedi'
  Plug 'ncm2/ncm2-go'
  Plug 'ncm2/ncm2-ultisnips'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  set completeopt=noinsert,menuone,noselect

  " gitgutter
  Plug 'airblade/vim-gitgutter'
  let g:gitgutter_realtime = 1
  set updatetime=50

  " NedTree Config
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  autocmd vimenter * NERDTree
  autocmd VimEnter * wincmd p
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
call plug#end()

autocmd BufEnter * call ncm2#enable_for_buffer()
call neomake#configure#automake('w')
