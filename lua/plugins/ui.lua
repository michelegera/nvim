local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('folke/which-key.nvim'),
  gh('MunifTanjim/nui.nvim'),
  gh('rcarriga/nvim-notify'),
  gh('folke/noice.nvim'),
})

require('which-key').setup({
  preset = 'modern',
  delay = 0,
  icons = {
    mappings = vim.g.have_nerd_font,
    keys = vim.g.have_nerd_font and {} or {
      Up = '<Up> ', Down = '<Down> ', Left = '<Left> ', Right = '<Right> ',
      C = '<C-…> ', M = '<M-…> ', D = '<D-…> ', S = '<S-…> ',
      CR = '<CR> ', Esc = '<Esc> ', NL = '<NL> ', BS = '<BS> ',
      Space = '<Space> ', Tab = '<Tab> ',
    },
  },
})

vim.notify = require('notify')

require('noice').setup({
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  presets = {
    inc_rename = true,
  },
})
