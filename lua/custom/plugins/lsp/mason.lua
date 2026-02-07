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
    local lspconfig = require 'lspconfig'
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

    local capabilities = cmp_nvim_lsp.default_capabilities()

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
      handlers = {
        function(server_name)
          lspconfig[server_name].setup {
            capabilities = capabilities,
          }
        end,
        ['lua_ls'] = function()
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' },
                },
                completion = {
                  callSnippet = 'Replace',
                },
              },
            },
          }
        end,
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'prettier',
        'stylua',
        { 'eslint_d', version = '13.1.2' },
      },
    }
  end,
}
