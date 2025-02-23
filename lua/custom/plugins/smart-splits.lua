-- smart-splits.nvim
-- https://github.com/mrjones2014/smart-splits.nvim

return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    local keymap = vim.keymap

    -- Resizing (accepts a range)
    keymap.set('n', '<A-h>', require('smart-splits').resize_left)
    keymap.set('n', '<A-j>', require('smart-splits').resize_down)
    keymap.set('n', '<A-k>', require('smart-splits').resize_up)
    keymap.set('n', '<A-l>', require('smart-splits').resize_right)

    -- Moving
    keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
    keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
    keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
    keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)

    -- Swapping
    keymap.set('n', '<C-A-h>', require('smart-splits').swap_buf_left)
    keymap.set('n', '<C-A-j>', require('smart-splits').swap_buf_down)
    keymap.set('n', '<C-A-k', require('smart-splits').swap_buf_up)
    keymap.set('n', '<C-A-l>', require('smart-splits').swap_buf_right)
  end,
}
