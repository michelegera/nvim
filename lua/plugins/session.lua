local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('rmagatti/auto-session'),
  gh('mrjones2014/smart-splits.nvim'),
  gh('szw/vim-maximizer'),
  gh('nvim-lua/plenary.nvim'),
  gh('nvim-tree/nvim-web-devicons'),
  gh('folke/todo-comments.nvim'),
  gh('folke/trouble.nvim'),
  gh('dgagn/diagflow.nvim'),
  gh('smjonas/inc-rename.nvim'),
})

-- auto-session: note suppressed_dirs (renamed from suppress_dirs in 2025)
require('auto-session').setup({
  auto_restore = false,
  suppressed_dirs = { '~/', '~/Downloads', '~/Documents', '~/Desktop' },
})

local keymap = vim.keymap

keymap.set('n', '<leader>wr', '<cmd>AutoSession restore<CR>', { desc = 'Restore session for cwd' })
keymap.set('n', '<leader>ws', '<cmd>AutoSession save<CR>', { desc = 'Save session' })

local splits = require('smart-splits')

keymap.set('n', '<A-h>', splits.resize_left)
keymap.set('n', '<A-j>', splits.resize_down)
keymap.set('n', '<A-k>', splits.resize_up)
keymap.set('n', '<A-l>', splits.resize_right)

keymap.set('n', '<C-h>', splits.move_cursor_left)
keymap.set('n', '<C-j>', splits.move_cursor_down)
keymap.set('n', '<C-k>', splits.move_cursor_up)
keymap.set('n', '<C-l>', splits.move_cursor_right)
keymap.set('n', '<C-\\>', splits.move_cursor_previous)

keymap.set('n', '<C-A-h>', splits.swap_buf_left)
keymap.set('n', '<C-A-j>', splits.swap_buf_down)
keymap.set('n', '<C-A-k>', splits.swap_buf_up)
keymap.set('n', '<C-A-l>', splits.swap_buf_right)

keymap.set('n', '<leader>sm', '<cmd>MaximizerToggle<CR>', { desc = '[S]plit [M]aximize/minimize' })

local todo = require('todo-comments')
todo.setup()
keymap.set('n', ']t', function() todo.jump_next() end, { desc = 'Next todo comment' })
keymap.set('n', '[t', function() todo.jump_prev() end, { desc = 'Previous todo comment' })

require('trouble').setup({ focus = true })
keymap.set('n', '<leader>xw', '<cmd>Trouble diagnostics toggle<CR>', { desc = 'Workspace diagnostics' })
keymap.set('n', '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Document diagnostics' })
keymap.set('n', '<leader>xq', '<cmd>Trouble quickfix toggle<CR>', { desc = 'Quickfix list' })
keymap.set('n', '<leader>xl', '<cmd>Trouble loclist toggle<CR>', { desc = 'Location list' })
keymap.set('n', '<leader>xt', '<cmd>Trouble todo toggle<CR>', { desc = 'Todos' })

require('diagflow').setup({
  placement = 'inline',
  inline_padding_left = 4,
})

require('inc_rename').setup({})
keymap.set('n', '<leader>rn', ':IncRename ', { desc = '[R]e[n]ame' })
