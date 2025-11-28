vim.lsp.config('nixd', {
  cmd = { 'nixd'  },
  filetypes = { 'nix'},
})

-- Enable Typescript Language Server
vim.lsp.enable('nixd')
