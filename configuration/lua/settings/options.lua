vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 999
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.cmd("colorscheme rose-pine")
vim.cmd("set cursorline")
vim.cmd("set conceallevel=2")
vim.cmd("set colorcolumn=140")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("let g:netrw_winsize=25")
vim.cmd("let g:netrw_browse_split=4")

local config = {
	virtual_text = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
}

vim.diagnostic.config(config)
