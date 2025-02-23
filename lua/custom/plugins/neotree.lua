-- neo-tree.nvim
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    local neo_tree = require 'neo-tree'

    neo_tree.setup {
      popup_border_style = 'rounded',
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
      },
    }

    vim.cmd [[nnoremap \ :Neotree reveal<cr>]]
  end,
}
