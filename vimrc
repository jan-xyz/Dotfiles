" general
syntax on
set number
set mouse=a
set list
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" terminal setup
"autocmd VimEnter * belowright terminal ++rows=14

" gitgutter
let g:gitgutter_realtime = 1
set updatetime=50

" theming
colorscheme nord
let g:airline_theme='nord'

" tmux support
set ttymouse=xterm2

" Change cursor shape between insert, replace and normal mode
" https://stackoverflow.com/questions/6488683/how-do-i-change-the-vim-cursor-in-insert-normal-mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let &t_SR = "\e[4 q"

" Go development
filetype plugin indent on
let g:go_gocode_unimported_packages = 1

" Python development
let g:pymode = 1
let g:pymode_rope = 1
let g:pymode_virtualenv = 1
let g:pymode_python = 'python3'
let g:pymode_lint_checkers = ['flake8', 'mccabe']
let g:pymode_rope_completion = 0

" IDE setup
nmap <F8> :TagbarToggle<CR>
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
:set colorcolumn=80
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" syntatstic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" syntastic golang
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']

" syntastic python
let g:syntastic_python_python_exec = 'python3'
