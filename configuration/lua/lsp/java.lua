vim.lsp.config('jdtls', {
  cmd = { 'jdtls' },
  filetypes = { 'java' },
})

vim.lsp.enable('jdtls')
