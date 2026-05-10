local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('folke/snacks.nvim'),
  gh('coder/claudecode.nvim'),
  gh('nickjvandyke/opencode.nvim'),
})

require('snacks').setup({
  input = {},
  picker = {
    actions = {
      opencode_send = function(...) return require('opencode').snacks_picker_send(...) end,
    },
  },
})

vim.o.autoread = true

require('claudecode').setup({})

require('which-key').add({
  { '<leader>a', group = 'Claude Code' },
  { '<leader>o', group = 'OpenCode' },
})

local keymap = vim.keymap
keymap.set('n', '<leader>ac', '<cmd>ClaudeCode<cr>', { desc = 'Toggle Claude' })
keymap.set('n', '<leader>af', '<cmd>ClaudeCodeFocus<cr>', { desc = 'Focus Claude' })
keymap.set('n', '<leader>ar', '<cmd>ClaudeCode --resume<cr>', { desc = 'Resume Claude' })
keymap.set('n', '<leader>aC', '<cmd>ClaudeCode --continue<cr>', { desc = 'Continue Claude' })
keymap.set('n', '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', { desc = 'Select Claude model' })
keymap.set('n', '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', { desc = 'Add current buffer' })
keymap.set('v', '<leader>as', '<cmd>ClaudeCodeSend<cr>', { desc = 'Send to Claude' })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
  callback = function(event)
    vim.keymap.set('n', '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>', {
      buffer = event.buf,
      desc = 'Add file',
    })
  end,
})
keymap.set('n', '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', { desc = 'Accept diff' })
keymap.set('n', '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', { desc = 'Deny diff' })

local opencode = require('opencode')
keymap.set({ 'n', 'x' }, '<leader>oa', function() opencode.ask('@this: ', { submit = true }) end, { desc = 'Ask OpenCode' })
keymap.set({ 'n', 'x' }, '<leader>os', function() opencode.select() end, { desc = 'Select OpenCode action' })
keymap.set('n', '<leader>ot', function() opencode.toggle() end, { desc = 'Toggle OpenCode' })
keymap.set('n', '<leader>ou', function() opencode.command('session.half.page.up') end, { desc = 'Scroll up' })
keymap.set('n', '<leader>od', function() opencode.command('session.half.page.down') end, { desc = 'Scroll down' })
keymap.set('n', '<leader>on', function() opencode.command('session.new') end, { desc = 'New session' })
keymap.set('n', '<leader>ol', function() opencode.command('session.select') end, { desc = 'List sessions' })
keymap.set({ 'n', 'x' }, 'go', function() return opencode.operator('@this ') end, { desc = 'Add range to OpenCode', expr = true })
keymap.set('n', 'goo', function() return opencode.operator('@this ') .. '_' end, { desc = 'Add line to OpenCode', expr = true })
