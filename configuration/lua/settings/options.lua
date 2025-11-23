vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 999
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.cmd('colorscheme unokai')
vim.cmd('set cursorline')
vim.cmd('set wildmenu')
vim.cmd('let g:netrw_liststyle=3')
vim.cmd('set path+=**')

local config = {
  virtual_text = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  -- float = {
  --   focusable = false,
  --   style = "minimal",
  --   border = "rounded",
  --   source = "always",
  --   header = "",
  --   prefix = "",
  -- },
}

vim.diagnostic.config(config)
