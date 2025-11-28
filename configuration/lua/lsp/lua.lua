
-- Set configuration for typescript language server
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
})

-- Enable Lua Language Server
vim.lsp.enable('lua_ls')
