-- Set configuration for typescript language server
vim.lsp.config("bashls", {
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "sh" },
})

-- Enable Lua Language Server
vim.lsp.enable("bashls")
