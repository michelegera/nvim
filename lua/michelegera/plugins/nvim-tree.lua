-- nvim-tree.lua
-- https://github.com/nvim-tree/nvim-tree.lua

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local nvimtree = require 'nvim-tree'

    -- Disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Configure nvim-tree
    nvimtree.setup {
      view = {
        width = 48, -- Set the width of the tree window
        relativenumber = true, -- Show relative line numbers
      },

      renderer = {
        indent_markers = {
          enable = true, -- Show indent markers
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = '→', -- Icon for closed folders
              arrow_open = '↓', -- Icon for open folders
            },
          },
        },
      },

      actions = {
        open_file = {
          window_picker = {
            enable = false, -- Disable window picker
          },
        },
      },
      filters = {
        custom = { '.DS_Store' }, -- Exclude .DS_Store files
      },
      git = {
        ignore = false, -- Show git ignored files
      },
    }

    -- Keymaps for nvim-tree
    local keymap = vim.keymap

    keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file' })
    keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
    keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })
  end,
}
