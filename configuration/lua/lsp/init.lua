local M = {}

function M.setup()
	-- Load all configuration parts
	require("lsp.typescript")
	require("lsp.lua")
	require("lsp.rust")
	require("lsp.python")
	require("lsp.nix")
	require("lsp.java")
	require("lsp.dart")
	require("lsp.bash")
	require("lsp.markdown")
	require("lsp.css")
	require("lsp.formatting")
	require("lsp.linting")

	vim.lsp.config("*", {
		root_markers = { ".git" },
	})
end

require("dapui").setup({})

M.setup()

return M
