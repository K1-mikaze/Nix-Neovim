
local M = {}

function M.setup()
  -- Load all configuration parts
  require('lsp.typescript')
  require('lsp.lua')
  require('lsp.rust')
  require('lsp.python')
  require('lsp.dart')

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

  local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    -- Diagnostic configuration
    -- local config = {
    --   virtual_text = true,
    --   signs = {
    --     active = signs,
    --   },
    --   update_in_insert = true,
    --   underline = true,
    --   severity_sort = true,
    --   float = {
    --     focusable = false,
    --     style = "minimal",
    --     border = "rounded",
    --     source = "always",
    --     header = "",
    --     prefix = "",
    --   },
    -- }

    -- vim.diagnostic.config(config)
-- Language servers setup
local servers = {
  'bashls',       -- Bash
  'dockerls',     -- Docker
  'jsonls',       -- JSON
  'yamlls',       -- YAML
  'marksman',     -- Markdown
  'taplo',        -- TOML
  'vimls',        -- Vim script
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
  })
end
  end
M.setup()

return M
