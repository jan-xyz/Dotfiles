lua require('init')

let g:python_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'

" Autocomplete:
autocmd BufEnter * lua require'completion'.on_attach()
set completeopt=menuone,noinsert,noselect
