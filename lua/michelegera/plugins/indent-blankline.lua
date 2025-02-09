-- indent-blankline.nvim
-- https://github.com/lukas-reineke/indent-blankline.nvim

return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  main = 'ibl',
  opts = {
    indent = { char = '┊' },
  },
}
