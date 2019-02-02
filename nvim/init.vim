call plug#begin()
  " Window Add-Ons
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/nerdtree'
  Plug 'arcticicestudio/nord-vim'

  " Language Extras
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " Git support
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tpope/vim-fugitive'

  " autocompletion and linting
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

  set number
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

  " linting
  let g:lsp_signs_error = {'text': '✗'}
  let g:lsp_signs_warning = {'text': '⚠'}
  let g:lsp_signs_enabled = 1
  let g:asyncomplete_auto_popup = 1
  let g:lsp_diagnostics_echo_cursor = 1
  set completeopt-=preview
  if executable('pyls')
    au User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ })
  endif
  if executable('gopls')
    au User lsp_setup call lsp#register_server({
    \ 'name': 'gopls',
    \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
    \ 'whitelist': ['go'],
    \ })
  endif


  " gitgutter
  let g:gitgutter_realtime = 1
  set updatetime=50

  " NedTree Config
  autocmd vimenter * NERDTree
  autocmd VimEnter * wincmd p
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

