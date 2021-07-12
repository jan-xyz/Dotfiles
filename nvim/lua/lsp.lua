-- TODO: migrate all keymaps to which-key
-- TODO: add language specific folders and split it into individual files (incl. debugger config?)
-- languageClients:
local nvim_lsp = require'lspconfig'
local wk = require("which-key")

-- Global callback functions for LSP shortcuts
local on_attach = function(client, bufnr)
  require'completion'.on_attach()
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local normal_mode_keymap = {
    d = {"<cmd>Telescope lsp_workspace_diagnostics<CR>", "diagnostics", noremap=true }
  }
  local visual_mode_keymap = {}
  if client.resolved_capabilities.code_lens then
    vim.cmd [[autocmd CursorHold,CursorHoldI,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]]
    normal_mode_keymap["c"] = {"<Cmd>lua vim.lsp.codelens.run()<CR>", "codelens", noremap=true }
  end

  if client.resolved_capabilities.document_formatting then
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 500)]]
  end
  if client.resolved_capabilities.goto_definition then
    wk.register({d={"<cmd>Telescope lsp_definitions<CR>", "Definition", noremap=true }}, { prefix = "g" })
  end
  if client.resolved_capabilities.hover then
    wk.register({K={"<cmd>lua vim.lsp.buf.hover()<CR>", "Definition", noremap=true }}, {})
  end
  if client.resolved_capabilities.rename then
    normal_mode_keymap["r"] = {"<Cmd>lua vim.lsp.buf.rename()<CR>", "rename", noremap=true }
  end
  if client.resolved_capabilities.code_action then
    visual_mode_keymap["a"] = {":Telescope lsp_range_code_actions<CR>", "range code actions", noremap=true }
    normal_mode_keymap["a"] = {":Telescope lsp_code_actions<CR>", "code actions", noremap=true }
  end
  if client.resolved_capabilities.find_references then
    wk.register({r={"<cmd>Telescope lsp_references<CR>", "References", noremap=true }}, { prefix = "g" })
  end
  if client.resolved_capabilities.document_symbol then
    normal_mode_keymap["s"] = {"<cmd>Vista!!<CR>", "symbols", noremap=true }
  end
  wk.register(normal_mode_keymap, { prefix = "l" })
  wk.register(visual_mode_keymap, { mode="v", prefix = "l" })
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
