return {
  'swaits/zellij-nav.nvim',
  lazy = true,
  event = 'VeryLazy',
  config = function()
    require('zellij-nav').setup()

    -- Ensures that when exiting NeoVim, Zellij returns to normal mode
    vim.api.nvim_create_autocmd('VimLeave', {
      pattern = '*',
      command = 'silent !zellij action switch-mode normal',
    })
  end,
  keys = {
    { '<C-h>', '<cmd>ZellijNavigateLeftTab<CR>', { silent = true, desc = 'Navigate left or tab' } },
    { '<C-j>', '<cmd>ZellijNavigateDown<CR>', { silent = true, desc = 'Navigate down' } },
    { '<C-k>', '<cmd>ZellijNavigateUp<CR>', { silent = true, desc = 'Navigate up' } },
    { '<C-l>', '<cmd>ZellijNavigateRightTab<CR>', { silent = true, desc = 'Navigate right or tab' } },
  },
}
