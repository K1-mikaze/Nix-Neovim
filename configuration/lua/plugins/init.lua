local M = {}

function M.setup()
  -- Load all configuration parts
  require('plugins.harpoon2')
  require('plugins.gitsigns')
  require('plugins.cmp')
  require('plugins.autopairs')
  require('plugins.luasnip')

end

-- Call setup when this module is required
M.setup()

return M
