vim.lsp.config('nixd', {
  cmd = { 'nixd'  },
  filetypes = { 'nix'},
  formatting =  {
    command = {"alejandra"},
  },
})

vim.lsp.enable('nixd')


