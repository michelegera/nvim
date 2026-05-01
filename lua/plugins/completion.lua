local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  -- cmp-nvim-lsp already added in lsp.lua (idempotent)
  gh('hrsh7th/cmp-nvim-lsp'),
  gh('hrsh7th/cmp-buffer'),
  gh('hrsh7th/cmp-path'),
  gh('hrsh7th/nvim-cmp'),
  -- LuaSnip: after first install, build jsregexp support manually:
  --   :!cd ~/.local/share/nvim-0.12/site/pack/core/opt/LuaSnip && make install_jsregexp
  gh('L3MON4D3/LuaSnip'),
  gh('saadparwaiz1/cmp_luasnip'),
  gh('rafamadriz/friendly-snippets'),
  gh('onsails/lspkind.nvim'),
})

-- Wire autopairs confirm integration now that cmp is available
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

local luasnip = require('luasnip')
local lspkind = require('lspkind')

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,preview,noselect',
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      ellipsis_char = '…',
      maxwidth = 64,
      mode = 'symbol',
    }),
  },
})
