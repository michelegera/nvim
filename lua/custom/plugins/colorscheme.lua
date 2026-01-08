-- Moonlight
-- https://github.com/shaunsingh/moonlight.nvim

return {
  'https://github.com/shaunsingh/moonlight.nvim',
  priority = 1000,
  config = function()
    local moonlight = require 'moonlight'

    moonlight.set()
  end,
}
