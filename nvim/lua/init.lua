-- languageClients:
local nvim_lsp = require'lspconfig'

nvim_lsp.bashls.setup{}
nvim_lsp.dockerls.setup{}
nvim_lsp.efm.setup{
  init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
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
nvim_lsp.sumneko_lua.setup{
  cmd = {'/Users/jan/dotfiles/submodules/lua-language-server/bin/macOS/lua-language-server', '-E', '/Users/jan/dotfiles/submodules/lua-language-server/main.lua'},
}
nvim_lsp.yamlls.setup{
  settings = {
    yaml = {
      schemas = {
        ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
        ['http://json.schemastore.org/github-action'] = '.github/**/action.{yml,yaml}',
        ['http://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}'
      }
    }
  }
}

-- Treesitter:
local tree_sitter = require'nvim-treesitter.configs'

tree_sitter.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}
