call plug#begin()
  " Window Add-Ons
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/nerdtree'
  Plug 'arcticicestudio/nord-vim'
  Plug 'majutsushi/tagbar'

  " Misc
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Git support
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tpope/vim-fugitive'

  " autocompletion and linting
  Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

  set number         " Add line numbers
  set hidden         " Enable hidden buffers
  set signcolumn=yes " Show signs in number column (e.g. errors and warnings)
  set list           " Show tabs, spaces and line ends
  set mouse=a        " Enable all mouse support
  set colorcolumn=80 " Show a line at the 80th character
  set expandtab      " Expand tabs to spaces per default
  set shiftwidth=2   " Set default auto-indent width
  set softtabstop=2  " Set default virtual tabstop width
  set tabstop=2      " Set default tabstop width
  colorscheme nord   " Set color scheme
  tnoremap <Esc> <C-\><C-n>
  let g:python_host_prog = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
  nmap <F8> :TagbarToggle<CR> " Toggle tag bar
  nmap <C-n> :bn<CR>  " Next buffer in list
  nmap <C-p> :bp<CR>  " Previous buffer in list

  " Autocomplete:
  let g:deoplete#enable_at_startup = 1

  " Linting: config
  let g:LanguageClient_serverCommands = {
    \ 'go': ['gopls'],
    \ 'python': ['pyls'],
    \ }
  let g:LanguageClient_rootMarkers = {
        \ 'go': ['.git', 'go.mod'],
        \ }
  " Go: Run gofmt and goimports on save
  autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

  " General: keyboard mappings
  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  nnoremap <silent> <F3> :call LanguageClient#textDocument_codeAction()<CR>
  set completefunc=LanguageClient#complete
  set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

  " Airline: config
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1

  " Gitgutter: Config
  let g:gitgutter_realtime = 1
  set updatetime=50

  " NedTree: Config
  autocmd vimenter * NERDTree
  autocmd VimEnter * wincmd p
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

