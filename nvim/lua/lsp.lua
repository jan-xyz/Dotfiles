-- languageClients:
local nvim_lsp = require'lspconfig'

local map = vim.api.nvim_buf_set_keymap
OPTIONS = { noremap = true }

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  if client.resolved_capabilities.document_formatting then
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 100)]]
  end
  if client.resolved_capabilities.goto_definition then
    map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', OPTIONS)
  end
  if client.resolved_capabilities.hover then
    map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', OPTIONS)
  end
  if client.resolved_capabilities.rename then
    map(bufnr, 'n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', OPTIONS)
  end
  if client.resolved_capabilities.code_action then
    map(bufnr, 'n', '<F3>', '<cmd>lua vim.lsp.buf.code_action()<CR>', OPTIONS)
  end
  if client.resolved_capabilities.find_references then
    map(bufnr, 'n', '<F4>', '<cmd>lua vim.lsp.buf.references()<CR>', OPTIONS)
  end
  map(bufnr, 'n', '<F5>', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', OPTIONS)
  if client.resolved_capabilities.document_symbol then
    map(bufnr, 'n', '<F8>', ':Vista!!<CR>', OPTIONS)
  end
end

nvim_lsp.bashls.setup{
  on_attach = on_attach,
}
nvim_lsp.dockerls.setup{
  on_attach = on_attach,
}
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
nvim_lsp.rust_analyzer.setup{
  on_attach = on_attach,
  settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "item",
                importPrefix = "by_self",
		importEnforceGranularity = true,
            },
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
nvim_lsp.vimls.setup{
  on_attach = on_attach,
}
nvim_lsp.metals.setup{
  on_attach = on_attach,
}
nvim_lsp.r_language_server.setup{
  on_attach = on_attach,
}
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
  on_attach = on_attach,
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
