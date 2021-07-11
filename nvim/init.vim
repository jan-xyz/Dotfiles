lua require('init')

let g:python_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'

" Autocomplete:
autocmd BufEnter * lua require'completion'.on_attach()
set completeopt=menuone,noinsert,noselect

let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'proto': ['buf-check-lint'],
  \ }

" Tag: config
let g:vista_default_executive = 'nvim_lsp'
