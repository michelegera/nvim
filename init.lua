-- Neovim 0.12 configuration
-- Uses built-in vim.pack plugin manager

require('core.globals')
require('core.options')
require('core.keymaps')
require('core.autocmds')

require('plugins.appearance')
require('plugins.ui')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.git')
require('plugins.editing')
require('plugins.lsp')
require('plugins.formatting')
require('plugins.linting')
require('plugins.completion')
