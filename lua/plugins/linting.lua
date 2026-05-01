local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('mfussenegger/nvim-lint'),
})

local lint = require('lint')

lint.linters_by_ft = {
  javascript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  markdown = { 'markdownlint' },
  typescript = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
}

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = vim.api.nvim_create_augroup('lint', { clear = true }),
  callback = function()
    lint.try_lint()
  end,
})

vim.keymap.set('n', '<leader>l', function()
  if vim.opt_local.modifiable:get() then
    lint.try_lint()
  end
end, { desc = 'Trigger linting for current file' })
