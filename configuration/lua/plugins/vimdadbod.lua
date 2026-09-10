-- vim-dadbod UI configuration
-- Read database connection info from DATABASE_URL and DATABASE_NAME
-- environment variables (not DBUI_URL/DBUI_NAME as requested)
vim.g.db_ui_use_nerdtree_to_toggle = 1
vim.g.db_ui_win_position = "right"

-- Environment variables for database connections
vim.g.db_ui_env_variable_url = "_URL"
vim.g.db_ui_env_variable_name = "_NAME"
vim.g.db_ui_dotenv_variable_prefix = "DATABASE"

-- require("schema-surfer").setup({
--   db_uri_env = "DATABASE_URL",
--   auto_build = false, -- Skip auto-build to avoid cargo network dependency
-- })
