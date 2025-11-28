
local M = {}

function M.setup()
  -- Load all configuration parts
  require('lsp.typescript')
  require('lsp.lua')
  require('lsp.rust')
  require('lsp.python')
  require('lsp.nix')
  require('lsp.java')

vim.lsp.config('*', {
  root_markers = { '.git' },
})
  end
M.setup()

return M
