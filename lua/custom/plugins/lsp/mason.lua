-- mason.nvim
-- https://github.com/mason-org/mason.nvim

return {
  'mason-org/mason.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'

    mason.setup {
      ui = {
        icons = {
          package_installed = '✔️',
          package_pending = '→',
          package_uninstalled = '✖️',
        },
      },
    }

    mason_lspconfig.setup {
      automatic_enable = true,
      ensure_installed = {
        'cssls',
        'emmet_ls',
        'eslint',
        'graphql',
        'html',
        'jsonls',
        'lua_ls',
        'ruby_lsp',
        'ts_ls',
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'prettier',
        'stylua',
        'eslint_d',
      },
    }
  end,
}
