-- Key mappings
local keymap = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Navigation
keymap('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Find files' })
keymap('n', '<leader>fa', ':Telescope live_grep theme=dropdown<CR>', { desc = 'Live grep' })
keymap('n', '<leader>fi', "<cmd>:lua require'telescope.builtin'.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({}))<CR>", { desc = 'Live grep in Current file' })
keymap('n', '<leader>fh', ':Telescope help_tags', { desc = 'Fuzzy search Documentation' })
keymap('n', '<leader>cf',  "<cmd>:lua require'telescope.builtin'.treesitter(require('telescope.themes').get_ivy({}))<CR>", { desc = 'Find Functions,Variables and more' })

-- Lsp
keymap('n', '<leader>cr', "<cmd>:lua require('telescope.builtin').lsp_references(require('telescope.themes').get_cursor({}))<CR>", { desc = 'Code References' })
keymap('n', '<leader>ca',  "<cmd>:lua vim.lsp.buf.code_action(require('telescope.themes').get_cursor({}))<CR>", { desc = 'Code Actions' })
keymap('n', '<leader>ce',  "<cmd>:lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({}))<CR>", { desc = 'Code Diagnostics' })
keymap('n', '<leader>cq',  "<cmd>:lua require'telescope.builtin'.quickfix(require('telescope.themes').get_ivy({})) <CR>", { desc = 'Quick Fix List' })
keymap('n', '<leader>cs',  "<cmd>:lua vim.diagnostic.open_float()<CR>", { desc = 'Show whole Code warning/error/suggestion' })
keymap('n', '<leader>cd',  "<cmd>:lua require('telescope.builtin').lsp_definitions(require('telescope.themes').get_cursor({}))<CR>", { desc = 'Code Definitions' })
keymap('n', '<leader>ci',  "<cmd>:lua require('telescope.builtin').lsp_implementations(require('telescope.themes').get_cursor({}))<CR>", { desc = 'Code Definitions' })
keymap('n', '<leader>cD',  "<cmd>:lua require('telescope.builtin').lsp_type_definitions(require('telescope.themes').get_dropdown({}))<CR>", { desc = 'Code Type Definitions' })

-- Git
keymap('n', '<leader>glb',  "<cmd>:Gitsigns toggle_current_line_blame<CR>", { desc = 'Toggle Line blames' })
keymap('n', '<M-2>',  "<cmd>:Neogit kind=floating<CR>", { desc = 'Open Neogit UI' })
keymap('n', '<leader>gb',  "<cmd>:Git blame<CR>", { desc = 'Open Git Blames' })

-- Others
keymap('n', '<C-s>', ':w<CR>', { desc = 'Save File' })
keymap('n', '<M-1>', ':Ex<CR>', { desc = 'Open Explorer' })
keymap('n', '<leader>olae', '<cmd>setlocal spell spelllang=en<CR>', { desc = 'Active  Language Spell Checker to English' })
keymap('n', '<leader>olas', '<cmd>setlocal spell spelllang=es<CR>', { desc = 'Active  Language Spell Checker to Spanish' })


