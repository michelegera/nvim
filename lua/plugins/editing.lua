local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  -- autopairs cmp integration is wired in completion.lua
  gh('windwp/nvim-autopairs'),
  gh('kylechui/nvim-surround'),
  gh('folke/flash.nvim'),
  gh('gbprod/substitute.nvim'),
})

require('nvim-autopairs').setup({
  check_ts = true,
  ts_config = {
    lua = { 'string' },
    javascript = { 'template_string' },
  },
})

require('nvim-surround').setup()

require('flash').setup()
-- flash.nvim owns s/S in n/x/o — substitute.nvim is remapped to gs/gss/gS
vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash' })
vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash Treesitter' })
vim.keymap.set('o', 'r', function() require('flash').remote() end, { desc = 'Remote Flash' })
vim.keymap.set({ 'o', 'x' }, 'R', function() require('flash').treesitter_search() end, { desc = 'Treesitter Search' })
vim.keymap.set('c', '<C-s>', function() require('flash').toggle() end, { desc = 'Toggle Flash Search' })

local substitute = require('substitute')
substitute.setup()
vim.keymap.set('n', 'gs', substitute.operator, { desc = 'Substitute with motion' })
vim.keymap.set('n', 'gss', substitute.line, { desc = 'Substitute line' })
vim.keymap.set('n', 'gS', substitute.eol, { desc = 'Substitute to end of line' })
vim.keymap.set('x', 'gs', substitute.visual, { desc = 'Substitute in visual mode' })
