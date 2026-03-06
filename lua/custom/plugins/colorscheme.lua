-- Moonlight
-- https://github.com/michelegera/moonlight.nvim

return {
  'michelegera/moonlight.nvim',
  priority = 1000,
  config = function()
    local status, moonlight = pcall(require, 'moonlight')
    if not status then
      vim.notify('Failed to load moonlight theme', vim.log.levels.ERROR)
      return
    end

    moonlight.setup()
    vim.cmd.colorscheme 'moonlight'
  end,
}
