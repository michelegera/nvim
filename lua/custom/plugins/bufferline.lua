-- bufferline.nvim
-- https://github.com/akinsho/bufferline.nvim

return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  version = '*',
  keys = {
    { '<Tab>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Cycle to next tab' },
    { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Cycle to previous tab' },
  },
  opts = {
    options = {
      mode = 'tabs',
      separator_style = { '', '' },
      show_buffer_close_icons = false,
      show_close_icon = false,
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(_, _, diagnostics_dict, context)
        -- No diagnostics for current tab
        if context.buffer:current() then
          return ''
        end

        local s = ' '
        for e, n in pairs(diagnostics_dict) do
          local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
          s = s .. n .. sym
        end
        return s
      end,
    },
  },
}
