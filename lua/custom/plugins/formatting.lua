-- conform.nvim
-- https://github.com/stevearc/conform.nvim

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        css = { 'prettier' },
        graphql = { 'prettier' },
        html = { 'prettier' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        json = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        yaml = { 'prettier' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
      conform.format {
        lsp_fallback = true,
        async = true,
        timeout_ms = 500,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
