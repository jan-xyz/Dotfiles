-- languageClients:
local nvim_lsp = require'lspconfig'

nvim_lsp.dockerls.setup{}
nvim_lsp.efm.setup{
  init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {formatCommand = "lua-format -i", formatStdin = true}
            },
            sh = {
              {formatCommand = "shfmt -ci -s -bn", formatStdin = true},
              {lintCommand = 'shellcheck -f gcc -x', lintSource = 'shellcheck', lintFormats= {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}}
            }
        }
    }
}
nvim_lsp.pyls.setup{
  cmd = {'/usr/local/bin/python3', '-m', 'pyls'};
}
nvim_lsp.gopls.setup{
  settings = {
    gopls = {
      gofumpt = true,
      analyses = {
        shadow = true,
        unusedparams = true,
      },
      staticcheck = true,
    }
  }
}
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
