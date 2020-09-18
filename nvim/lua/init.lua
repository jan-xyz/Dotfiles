local nvim_lsp = require'nvim_lsp'

nvim_lsp.bashls.setup{}
nvim_lsp.dockerls.setup{}
nvim_lsp.pyls.setup{}
nvim_lsp.gopls.setup{}
nvim_lsp.kotlin_language_server.setup{
  cmd = {'kotlin-language-server'};
}
nvim_lsp.vimls.setup{}
nvim_lsp.metals.setup{}
nvim_lsp.r_language_server.setup{}
nvim_lsp.sumneko_lua.setup{}
