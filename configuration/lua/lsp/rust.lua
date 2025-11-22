local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Rust (rust-analyzer) should be changed for rustaceannvim
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = true   },
  },
})

-- -- Language servers setup
-- local servers = {
--   'bashls',       -- Bash
--   'dockerls',     -- Docker
--   'jsonls',       -- JSON
--   'yamlls',       -- YAML
--   'marksman',     -- Markdown
--   'taplo',        -- TOML
--   'vimls',        -- Vim script
--   'lua_ls',
-- }
--
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup({
--     capabilities = capabilities,
--   })
-- end

-- -- Python (pyright)
-- lspconfig.pyright.setup({
--   capabilities = capabilities,
--   settings = {
--     python = {
--       analysis = {
--         typeCheckingMode = "basic",
--         autoSearchPaths = true,
--         useLibraryCodeForTypes = true,
--       },
--     },
--   },
-- })



-- TypeScript/JavaScript

-- Go
-- lspconfig.gopls.setup({
--   capabilities = capabilities,
--   settings = {
--     gopls = {
--       analyses = {
--         unusedparams = true,
--       },
--       staticcheck = true,
--     },
--   },
-- })

