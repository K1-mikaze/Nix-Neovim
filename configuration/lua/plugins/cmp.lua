vim.cmd("hi Pmenu guibg=#1e1e2e")
local cmp = require'cmp'
local lspkind = require('lspkind')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
performance = {
    debounce = 30, -- Reduce debounce time (default: 60)
    throttle = 30, -- Reduce throttle time (default: 30)
    fetching_timeout = 100, -- Timeout for async sources (default: 500)
  },
  formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol_text', -- show only symbol and text
        maxwidth = 50,
        ellipsis_char = '...', -- when popup menu exceed maxwidth
        before = function(entry, vim_item)
          return vim_item
        end
      })
    },

  view = {
    entries = "custom"
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
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<CR>'] = cmp.mapping.confirm({ select = true,behavior = cmp.ConfirmBehavior.Replace}),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 20 },
    { name = 'luasnip' },
    { name = 'path',max_item_count = 5},
    { name = 'obsidian'},
  })
})


