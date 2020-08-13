call plug#begin()
  " Window Add-Ons
  Plug 'vim-airline/vim-airline'
  Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
  Plug 'majutsushi/tagbar'
  Plug 'voldikss/vim-floaterm'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

  " Misc
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Git support
  Plug 'airblade/vim-gitgutter'
  Plug 'kristijanhusak/defx-git'
  Plug 'tpope/vim-fugitive'

  " autocompletion and linting
  Plug 'neovim/nvim-lsp'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/deoplete-lsp'
  Plug 'uber/prototool', { 'rtp':'vim/prototool' }
  Plug 'w0rp/ale'

  " language specific support
  Plug 'udalov/kotlin-vim'
  Plug 'sebdah/vim-delve'
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
let g:deoplete#enable_at_startup = 1
set completeopt=menu,noinsert " select first item in list

let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'proto': ['prototool-lint'],
  \ }

" Linting: config
" Open/Close quickfix window on save
autocmd BufWritePost * :cw

lua << END
  require'nvim_lsp'.bashls.setup{}
  require'nvim_lsp'.dockerls.setup{}
  require'nvim_lsp'.pyls.setup{}
  require'nvim_lsp'.gopls.setup{}
  require'nvim_lsp'.kotlin_language_server.setup{}
  require'nvim_lsp'.vimls.setup{}
  require'nvim_lsp'.metals.setup{}

-- add Diagnostics to quickfix list
-- https://github.com/neovim/nvim-lsp/issues/69#issuecomment-616816555
do
  local method = "textDocument/publishDiagnostics"
  local default_callback = vim.lsp.callbacks[method]
  vim.lsp.callbacks[method] = function(err, method, result, client_id)
    default_callback(err, method, result, client_id)
    if result and result.diagnostics then
      for _, v in ipairs(result.diagnostics) do
        v.bufnr = client_id
        v.lnum = v.range.start.line + 1
        v.col = v.range.start.character + 1
        v.text = v.message
      end
      vim.lsp.util.set_qflist(result.diagnostics)
    end
  end
end

END
" Go: Run gofmt and goimports on save
autocmd BufWritePre *.go :call v:lua.vim.lsp.buf.formatting()

" General: keyboard mappings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <F2>  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <F3>  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <F4>  <cmd>lua vim.lsp.buf.references()<CR>
set omnifunc=v:lua.vim.lsp.omnifunc

" Airline: config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let airline#extensions#tabline#middle_click_preserves_windows = 1

" Gitgutter: Config
let g:gitgutter_realtime = 1
set updatetime=50

" Defx:
call defx#custom#option('_', {
      \ 'columns': 'mark:indent:git:icon:filename:type',
      \ 'split': 'floating',
      \ 'show_ignored_files': 1,
      \ 'toggle': 1,
      \ })
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | Defx | endif
nnoremap <silent> <leader>f :<C-u>Defx -search=`expand('%:p')` `getcwd()`<CR>
nnoremap <silent> <leader>g :<C-u>Defx<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <2-LeftMouse>
        \  defx#is_directory() ?
        \ defx#do_action('open_or_close_tree') :
        \ defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> <CR>
        \  defx#is_directory() ?
        \ defx#do_action('open_or_close_tree') :
        \ defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> s
        \ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy
        \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
        \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
        \ defx#do_action('toggle_select_all')
endfunction
