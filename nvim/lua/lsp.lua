-- languageClients:
local nvim_lsp = require'lspconfig'

local on_attach = function(client, bufnr)
  -- Autoformat on save
  if client.resolved_capabilities.document_formatting then
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 100)]]
  end
  if client.resolved_capabilities.hover then
  end
end

nvim_lsp.bashls.setup{
  on_attach = on_attach,
}
nvim_lsp.dockerls.setup{}
nvim_lsp.efm.setup{
  init_options = {documentFormatting = true},
    filetypes = {"sh"},
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
  on_attach = on_attach,
  cmd = {'/usr/local/bin/python3', '-m', 'pyls'};
}
nvim_lsp.rls.setup{
  on_attach = on_attach,
  settings = {
    rust = {
      clippy_preference = "on",
    }
  }
}
nvim_lsp.gopls.setup{
  on_attach = on_attach,
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
  on_attach = on_attach,
  cmd = {'kotlin-language-server'};
}
nvim_lsp.vimls.setup{}
nvim_lsp.metals.setup{}
nvim_lsp.r_language_server.setup{}
nvim_lsp.sumneko_lua.setup{
  on_attach = on_attach,
  cmd = {'/Users/jan/dotfiles/submodules/lua-language-server/bin/macOS/lua-language-server', '-E', '/Users/jan/dotfiles/submodules/lua-language-server/main.lua'},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    }
  }
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
