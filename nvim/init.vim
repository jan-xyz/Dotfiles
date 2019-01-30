call plug#begin()
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'tell-k/vim-autopep8'
  Plug 'davidhalter/jedi-vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'neomake/neomake'
  Plug 'ncm2/ncm2' " completion manager
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-jedi'
  Plug 'ncm2/ncm2-go'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
call plug#end()

  set number
  set mouse=a
  set colorcolumn=80
  colorscheme nord
  tnoremap <Esc> <C-\><C-n>
  let g:python_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'

  " linting
  call neomake#configure#automake('nrwi', 750)

  " python config
  let g:autopep8_disable_show_diff=1 " do not show autopep8 diff window
  let g:autopep8_on_save = 1 " autopep8 on safe

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

