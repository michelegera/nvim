local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('nvim-lua/plenary.nvim'),
  gh('nvim-tree/nvim-web-devicons'),
  gh('MunifTanjim/nui.nvim'),
  { src = gh('nvim-neo-tree/neo-tree.nvim'), version = 'v3.x' },
})

require('neo-tree').setup({
  popup_border_style = 'rounded',
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignore = true,
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
})

vim.keymap.set('n', '\\', '<cmd>Neotree reveal<cr>', { desc = 'Reveal in Neo-tree' })
