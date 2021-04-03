lua require('init')

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
set title          " set the window title
set titlestring=(%{fnamemodify(getcwd(),\ \":t\")})\ %f " set the content of the window title
colorscheme nord   " Set color scheme
tnoremap <Esc> <C-\><C-n>
let g:python_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'
nmap <F8> :TagbarToggle<CR> " Toggle tag bar
nmap <C-n> :bn<CR>  " Next buffer in list
nmap <C-p> :bp<CR>  " Previous buffer in list

" Terminal:
let g:floaterm_keymap_toggle = '<Leader>t'
let g:floaterm_position = 'center'

" Autocomplete:
autocmd BufEnter * lua require'completion'.on_attach()
set completeopt=menuone,noinsert,noselect

let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'proto': ['buf-check-lint'],
  \ }

" Tag: config
let g:vista_default_executive = 'nvim_lsp'
nnoremap <silent> <leader>c :Vista!!<CR>

" General: keyboard mappings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <F2>  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <F3>  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <F4>  <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <F5>  <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
set omnifunc=v:lua.vim.lsp.omnifunc

" Airline: config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let airline#extensions#tabline#middle_click_preserves_windows = 1

" Gitgutter: Config
let g:gitgutter_realtime = 1

" Spell: sync spell files
for d in glob('~/.config/nvim/spell/*.add', 1, 1)
    if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
        exec 'mkspell! ' . fnameescape(d)
    endif
endfor
