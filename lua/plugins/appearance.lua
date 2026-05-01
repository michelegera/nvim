local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('michelegera/moonlight.nvim'),
})

require('moonlight').setup()
vim.cmd.colorscheme('moonlight')
