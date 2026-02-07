-- nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig

return {
  "neovim/nvim-lspconfig",
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
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
        map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        map('[d', diagnostic.goto_prev, 'Goto previous diagnostic')
        map(']d', diagnostic.goto_next, 'Goto next diagnostic')
        map('K', buf.hover, '[K] Show documentation for what is under cursor')
      end,
    })

    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.Error,
          [vim.diagnostic.severity.WARN]  = signs.Warn,
          [vim.diagnostic.severity.HINT]  = signs.Hint,
          [vim.diagnostic.severity.INFO]  = signs.Info,
        },
      },
    })
  end,
}
