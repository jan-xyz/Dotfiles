call plug#begin()
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tell-k/vim-autopep8'
Plug 'python-rope/ropevim'
call plug#end()

set number
set mouse=a

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" gitgutter
let g:gitgutter_realtime = 1
set updatetime=50

" NedTree Config
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
:set colorcolumn=80
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
