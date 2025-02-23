-- inc-rename.nvim
-- https://github.com/smjonas/inc-rename.nvim

return {
  'smjonas/inc-rename.nvim',
  config = function()
    require('inc_rename').setup {}

    vim.keymap.set('n', '<leader>rn', ':IncRename ', { desc = '[R]e[n]ame' })
  end,
}
