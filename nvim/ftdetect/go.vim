autocmd BufRead,BufNewFile * if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif
autocmd BufRead,BufNewFile go.sum set filetype=gosum

" remove the autocommands for modsim3, and lprolog files so that their
" highlight groups, syntax, etc. will not be loaded. *.MOD is included, so
" that on case insensitive file systems the module2 autocmds will not be
" executed.
autocmd! BufRead,BufNewFile *.mod,*.MOD
autocmd BufNewFile,BufRead go.mod set filetype=gomod
