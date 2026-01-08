-- Koalight
-- https://github.com/Koalhack/koalight.nvim

return {
  'Koalhack/koalight.nvim',
  priority = 1000,
  config = function()
    local status, koalight = pcall(require, "koalight")
    if not status then return end

    vim.cmd.colorscheme 'koalight'
  end,
}
