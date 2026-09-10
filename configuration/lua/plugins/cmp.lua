vim.cmd("hi Pmenu guibg=#1e1e2e")
local cmp = require("cmp")
local lspkind = require("lspkind")

-- Global setup with all sources
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	performance = {
		debounce = 30,
		throttle = 30,
		fetching_timeout = 100,
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 50,
			ellipsis_char = "...",
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
	view = {
		entries = "custom",
	},
	window = {
		completion = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "dadbod_grip" },
	}),
})

-- Set DB connection for SQL buffers (runs on BufEnter, not just FileType)
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
	pattern = { "*.sql", "*.mysql", "*.plsql", "sql", "mysql", "plsql" },
	callback = function()
		-- Read DATABASE_URL from os.getenv directly (not vim.env)
		local db_url = os.getenv("DATABASE_URL")
		if db_url and db_url ~= "" then
			vim.g.db = db_url
			vim.b.db = db_url
		end
	end,
})

-- Filetype-specific setup for SQL
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "sql", "mysql", "plsql" },
	callback = function()
		-- Override sources for SQL buffers to prioritize dadbod_grip
		cmp.setup.buffer({
			sources = {
				{ name = "dadbod_grip" },
			},
		})
	end,
})

-- Manual command to set database connection for current buffer
vim.api.nvim_create_user_command("SetDB", function(opts)
	local url = opts.args
	if url and url ~= "" then
		vim.b.db = url
		vim.g.db = url
		vim.notify("DB connection set to: " .. url, vim.log.levels.INFO)
	end
end, { nargs = 1, complete = "file" })