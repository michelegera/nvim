local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('stevearc/conform.nvim'),
})

require('conform').setup({
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
})

vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
  require('conform').format({ lsp_fallback = true, async = true, timeout_ms = 500 })
end, { desc = 'Format file or range (in visual mode)' })
