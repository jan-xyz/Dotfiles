" Installed Plugins:
" git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
" git clone https://github.com/majutsushi/tagbar ~/.vim/pack/plugins/start/tagbar
" git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/plugins/start/nerdtree
" git clone https://github.com/vim-syntastic/syntastic ~/.vim/pack/plugins/start/syntastic
" git clone https://github.com/Valloric/YouCompleteMe ~/.vim/pack/plugins/start/YouCompleteMe
" git clone https://github.com/tpope/vim-sensible ~/.vim/pack/plugins/start/vim-sensible
" git clone https://github.com/python-mode/python-mode ~/.vim/pack/plugins/start/python-mode
" git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/plugins/start/vim-airline
" git clone https://github.com/tpope/vim-fugitive ~/.vim/pack/plugins/start/vim-fugitive


" general
syntax on
set number
set mouse=a
set list
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Change cursor shape between insert, replace and normal mode
" https://stackoverflow.com/questions/6488683/how-do-i-change-the-vim-cursor-in-insert-normal-mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let &t_SR = "\e[4 q"

" Go development
filetype plugin indent on

" Python development
let g:pymode = 1
let g:pymode_rope = 1
let g:pymode_virtualenv = 1
let g:pymode_python = 'python3'

" IDE setup
nmap <F8> :TagbarToggle<CR>
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" syntatstic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
