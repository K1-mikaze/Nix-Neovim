local M = {}

function M.setup()
  -- Load all configuration parts
  require('plugins.gitsigns')
  require('plugins.cmp')
  require('plugins.luasnip')
  require('plugins.markdown-preview')

end

-- Call setup when this module is required
M.setup()

return M
