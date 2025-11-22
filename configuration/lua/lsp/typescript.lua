
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Common capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true


lspconfig.ts_ls.setup({
  capabilities = capabilities,
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

-- Lua
-- lspconfig.lua_ls.setup({
--   capabilities = capabilities,
--   settings = {
--     Lua = {
--       runtime = {
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         globals = { 'vim' },
--       },
--       workspace = {
--         library = vim.api.nvim_get_runtime_file("", true),
--         checkThirdParty = false,
--       },
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- })

-- -- Rust (rust-analyzer)
-- lspconfig.rust_analyzer.setup({
--   capabilities = capabilities,
--   settings = {
--     ['rust-analyzer'] = {
--       checkOnSave = {
--         command = "clippy",
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

