call plug#begin()
  " Window Add-Ons
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/nerdtree'
  Plug 'arcticicestudio/nord-vim'
  Plug 'majutsushi/tagbar'

  " Misc
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Language Extras
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " Git support
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tpope/vim-fugitive'

  " autocompletion and linting
  Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
call plug#end()

  set number
  set hidden
  set signcolumn=yes
  set list
  set mouse=a
  set colorcolumn=80
  set expandtab
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  colorscheme nord
  tnoremap <Esc> <C-\><C-n>
  let g:python_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
  nmap <F8> :TagbarToggle<CR>

  " linting
  let g:LanguageClient_serverCommands = {
    \ 'go': ['gopls'],
    \ 'python': ['pyls'],
    \ }
  let g:LanguageClient_rootMarkers = {
        \ 'go': ['.git', 'go.mod'],
        \ }
  function! LC_maps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
      nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
      nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
      nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    endif
  endfunction
  autocmd FileType * call LC_maps()
  set completefunc=LanguageClient#complete
  set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

  " gitgutter
  let g:gitgutter_realtime = 1
  set updatetime=50

  " NedTree Config
  autocmd vimenter * NERDTree
  autocmd VimEnter * wincmd p
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

