-- TODO: migrate all keymaps to which-key
-- TODO: add language specific folders and split it into individual files (incl. debugger config?)
-- languageClients:
local nvim_lsp = require'lspconfig'

local map = vim.api.nvim_buf_set_keymap
OPTIONS = { noremap = true }

-- Global callback functions for LSP shortcuts
local on_attach = function(client, bufnr)
  require'completion'.on_attach()
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  if client.resolved_capabilities.code_lens then
    vim.cmd [[autocmd CursorHold,CursorHoldI,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]]
    map(bufnr, "n", "lc", "<Cmd>lua vim.lsp.codelens.run()<CR>", {silent = true;})
  end

  if client.resolved_capabilities.document_formatting then
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 500)]]
  end
  if client.resolved_capabilities.goto_definition then
    map(bufnr, 'n', 'gd', ':Telescope lsp_definitions<CR>', OPTIONS)
  end
  if client.resolved_capabilities.hover then
    map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', OPTIONS)
  end
  if client.resolved_capabilities.rename then
    map(bufnr, 'n', 'lr', '<cmd>lua vim.lsp.buf.rename()<CR>', OPTIONS)
  end
  if client.resolved_capabilities.code_action then
    map(bufnr, 'n', 'la', ':Telescope lsp_code_actions<CR>', OPTIONS)
    map(bufnr, 'v', 'la', ':Telescope lsp_range_code_actions<CR>', OPTIONS)
  end
  if client.resolved_capabilities.find_references then
    map(bufnr, 'n', 'gr', ':Telescope lsp_references<CR>', OPTIONS)
  end
  map(bufnr, 'n', 'ld', ':Telescope lsp_workspace_diagnostics<CR>', OPTIONS)
  if client.resolved_capabilities.document_symbol then
    map(bufnr, 'n', 'ls', ':Vista!!<CR>', OPTIONS)
  end
end

--  C/C++
nvim_lsp.ccls.setup{}

-- Docker
nvim_lsp.dockerls.setup{
  on_attach = on_attach,
}

-- Shell/Bash
nvim_lsp.bashls.setup{
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

-- Python
nvim_lsp.pyls.setup{
  on_attach = on_attach,
  cmd = {'/usr/local/bin/python3', '-m', 'pyls'};
}

-- Rust
vim.cmd [[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"ChainingHint"} }]]
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

-- Go
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

-- Kotlin
nvim_lsp.kotlin_language_server.setup{
  on_attach = on_attach,
  cmd = {'kotlin-language-server'};
}

-- VIM
nvim_lsp.vimls.setup{
  on_attach = on_attach,
}

-- Scala
nvim_lsp.metals.setup{
  on_attach = on_attach,
}

-- R
nvim_lsp.r_language_server.setup{
  on_attach = on_attach,
}

-- LUA
local luadev = require("lua-dev").setup({
  lspconfig = {
    on_attach = on_attach,
    cmd = {'lua-langserver'},
  },
})
nvim_lsp.sumneko_lua.setup(luadev)

-- YAML
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
