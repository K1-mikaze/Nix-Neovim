
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Common capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true


-- Python (pyright)
lspconfig.pyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
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



