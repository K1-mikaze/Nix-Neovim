vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Navigation
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
keymap("n", "<leader>fa", ":Telescope live_grep theme=dropdown<CR>", { desc = "Live grep" })
keymap(
	"n",
	"<leader>fi",
	"<cmd>:lua require'telescope.builtin'.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({}))<CR>",
	{ desc = "Live grep in Current file" }
)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Fuzzy search Documentation" })

-- Lsp
keymap(
	"n",
	"<leader>cr",
	"<cmd>:lua require('telescope.builtin').lsp_references(require('telescope.themes').get_cursor({}))<CR>",
	{ desc = "Code References" }
)
keymap(
	"n",
	"<leader>cd",
	"<cmd>:lua require'telescope.builtin'.treesitter(require('telescope.themes').get_ivy({}))<CR>",
	{ desc = "Find Functions,Variables and more" }
)
keymap(
	"n",
	"<leader>ca",
	"<cmd>:lua vim.lsp.buf.code_action(require('telescope.themes').get_cursor({}))<CR>",
	{ desc = "Code Actions" }
)
keymap(
	"n",
	"<leader>ce",
	"<cmd>:lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({}))<CR>",
	{ desc = "Code Diagnostics" }
)
keymap(
	"n",
	"<leader>cq",
	"<cmd>:lua require'telescope.builtin'.quickfix(require('telescope.themes').get_ivy({})) <CR>",
	{ desc = "Quick Fix List" }
)
keymap(
	"n",
	"<leader>cs",
	"<cmd>:lua vim.diagnostic.open_float()<CR>",
	{ desc = "Show whole Code warning/error/suggestion" }
)
keymap(
	"n",
	"<leader>ci",
	"<cmd>:lua require('telescope.builtin').lsp_implementations(require('telescope.themes').get_cursor({}))<CR>",
	{ desc = "Code Definitions" }
)

-- Debug
keymap("n", "<F5>", function()
	require("dap").continue()
end)
keymap("n", "<F10>", function()
	require("dap").step_over()
end)
keymap("n", "<F11>", function()
	require("dap").step_into()
end)
keymap("n", "<F12>", function()
	require("dap").step_out()
end)
keymap("n", "<leader>cb", function()
	require("dap").toggle_breakpoint()
end)
keymap("n", "<leader>cD", function()
	require("dapui").toggle()
end)

-- Git
keymap("n", "<leader>glb", "<cmd>:Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Line blames" })
keymap("n", "<F2>", "<cmd>:LazyGit<CR>", { desc = "Toggle LazyGit UI" })
keymap("n", "<leader>gb", "<cmd>:Git blame<CR>", { desc = "Open Git Blames" })

-- DataBase
keymap("n", "<F3>", "<cmd>:DBUIToggle<CR>", { desc = "Toggle DBUI Sidebar" })

-- Others
keymap("i", "`", "``<left>")
keymap("i", "'", "''<left>")
keymap("i", '"', '""<left>')
keymap("i", "(", "()<left>")
keymap("i", "{", "{}<left>")
keymap("i", "[", "[]<left>")

keymap("i", "/*", "/**/<left><left>")
keymap("n", "<C-s>", ":w<CR>", { desc = "Save File" })
keymap("n", "<Tab>", ":Telescope marks theme=ivy<CR>", { desc = "Open telescope marks" })
keymap("n", "<F1>", ":Neotree toggle right<CR>", { desc = "Open Explorer" })
keymap(
	"n",
	"<leader>olae",
	"<cmd>setlocal spell spelllang=en<CR>",
	{ desc = "Active  Language Spell Checker to English" }
)
keymap(
	"n",
	"<leader>olas",
	"<cmd>setlocal spell spelllang=es<CR>",
	{ desc = "Active  Language Spell Checker to Spanish" }
)
keymap("v", "<leader>r", '"hy:%s/<C-r>h//gc<left><left>', { desc = "rename a variable or whatever" })
keymap("v", "<leader>hg", '"hy:!curl <C-r>h<CR>', { desc = "use Curl Get method" })
