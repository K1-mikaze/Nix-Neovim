local M = {}

function M.setup()
  -- Load all configuration parts
  require('plugins.gitsigns')
  require('plugins.cmp')
  require('plugins.luasnip')
  require('plugins.markdown-preview')
  require('plugins.obsidian')
  require('plugins.tmux')
end

M.setup()

return M
