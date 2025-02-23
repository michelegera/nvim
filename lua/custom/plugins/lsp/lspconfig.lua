-- nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig

return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local mason_lspconfig = require 'mason-lspconfig'
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, silent = true, desc = 'LSP: ' .. desc })
        end

        local buf = vim.lsp.buf
        local builtin = require 'telescope.builtin'
        local diagnostic = vim.diagnostic

        map('gD', buf.declaration, '[G]oto [D]eclaration')
        map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
        map('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
        map('gr', builtin.lsp_references, '[G]oto [R]eferences')

        map('<leader>bd', '<cmd>Telescope diagnostics bufnr=0<CR>', 'Show [B]uffer [D]iagnostics')
        map('<leader>ca', buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
        map('<leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')
        map('<leader>d', diagnostic.open_float, 'Show [L]ine [D]iagnostics')
        map('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>rn', buf.rename, '[R]e[n]ame')
        map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        map('[d', diagnostic.goto_prev, 'Goto previous diagnostic')
        map(']d', diagnostic.goto_next, 'Goto next diagnostic')
        map('K', buf.hover, '[K] Show documentation for what is under cursor')
      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()
    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }

    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type

      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    mason_lspconfig.setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
        }
      end,

      ['graphql'] = function()
        lspconfig['graphql'].setup {
          capabilities = capabilities,
          filetypes = {
            'gql',
            'graphql',
            'javascriptreact',
            'typescriptreact',
          },
        }
      end,

      ['emmet_ls'] = function()
        lspconfig['emmet_ls'].setup {
          capabilities = capabilities,
          filetypes = {
            'css',
            'html',
            'javascriptreact',
            'less',
            'sass',
            'scss',
            'typescriptreact',
          },
        }
      end,

      ['lua_ls'] = function()
        lspconfig['lua_ls'].setup {
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
    }
  end,
}
