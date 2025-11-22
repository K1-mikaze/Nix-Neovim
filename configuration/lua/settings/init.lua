-- Main configuration module
local M = {}

function M.setup()
  -- Load all configuration parts
  require('settings.options')
  require('settings.keymaps')
  -- require('myconfig.plugins')
end

-- Call setup when this module is required
M.setup()


return M
