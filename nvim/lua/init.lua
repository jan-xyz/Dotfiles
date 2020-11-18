-- languageClients:
local nvim_lsp = require'lspconfig'

nvim_lsp.bashls.setup{}
nvim_lsp.dockerls.setup{}
nvim_lsp.pyls.setup{
  cmd = {'/usr/local/bin/python3', '-m', 'pyls'};
}
nvim_lsp.gopls.setup{}
nvim_lsp.kotlin_language_server.setup{
  cmd = {'kotlin-language-server'};
}
nvim_lsp.vimls.setup{}
nvim_lsp.metals.setup{}
nvim_lsp.r_language_server.setup{}
nvim_lsp.sumneko_lua.setup{}

-- Treesitter:
local tree_sitter = require'nvim-treesitter.configs'

tree_sitter.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}
