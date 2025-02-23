-- tokyonight.nvim
-- https://github.com/folke/tokyonight.nvim

return {
  'folke/tokyonight.nvim',
  priority = 1000,
  config = function()
    vim.cmd 'colorscheme tokyonight-moon'
  end,
}
