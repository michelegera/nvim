local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('michelegera/moonlight.nvim'),
  gh('nvim-tree/nvim-web-devicons'),
  gh('nvim-lualine/lualine.nvim'),
  gh('akinsho/bufferline.nvim'),
  gh('lukas-reineke/indent-blankline.nvim'),
})

require('moonlight').setup()
vim.cmd.colorscheme('moonlight')

require('lualine').setup({
  options = {
    theme = 'moonlight',
  },
  sections = {
    lualine_x = {
      { 'encoding' },
      { 'fileformat' },
      { 'filetype' },
    },
  },
})

require('bufferline').setup({
  options = {
    mode = 'tabs',
    separator_style = { '', '' },
    show_buffer_close_icons = false,
    show_close_icon = false,
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(_, _, diagnostics_dict, context)
      if context.buffer:current() then
        return ''
      end
      local s = ' '
      for e, n in pairs(diagnostics_dict) do
        local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
        s = s .. n .. sym
      end
      return s
    end,
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Cycle to next tab' })
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Cycle to previous tab' })

require('ibl').setup({
  indent = { char = '┊' },
})
