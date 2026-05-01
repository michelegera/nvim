local gh = function(x) return 'https://github.com/' .. x end

-- nvim-treesitter was archived April 2026 — still functional for Neovim 0.12
-- After first install, run :TSUpdate to compile parsers
vim.pack.add({
  gh('nvim-treesitter/nvim-treesitter'),
  gh('windwp/nvim-ts-autotag'),
})

require('nvim-treesitter.config').setup({
  highlight = { enable = true },
  indent = { enable = true },
  ensure_installed = {
    'bash',
    'css',
    'gitignore',
    'graphql',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-space>',
      node_incremental = '<C-space>',
      scope_incremental = false,
      node_decremental = '<bs>',
    },
  },
})

require('nvim-ts-autotag').setup()
