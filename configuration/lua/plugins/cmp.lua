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
        maxwidth = 50, -- prevent the popup from showing more than provided characters
        ellipsis_char = '...', -- when popup menu exceed maxwidth
        
        -- The function below will be called before any actual modifications from lspkind
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
      scrollbar = true,
      max_width = 80,
      max_height = 20,
    },
 documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      scrollbar = true,
      max_width = 80,
      max_height = 15,
    },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 20 },
    { name = 'luasnip', max_item_count = 10}, -- For vsnip users.
  -- }, {
    { name = 'path',max_item_count = 5},
  })
})


