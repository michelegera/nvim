local keymap = vim.keymap

keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode' })
keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

keymap.set('n', '<leader>sv', '<C-w>v', { desc = '[S]plit [V]ertically' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = '[S]plit [H]orizontally' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = '[S]plit [E]qual size' })
keymap.set('n', '<leader>sc', '<cmd>close<CR>', { desc = '[S]plit [C]lose' })

keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = '[T]ab open' })
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = '[T]ab [C]lose' })
keymap.set('n', '<leader>tn', '<cmd>tabnext<CR>', { desc = '[T]ab [N]ext' })
keymap.set('n', '<leader>tp', '<cmd>tabprevious<CR>', { desc = '[T]ab [P]revious' })
keymap.set('n', '<leader>tb', '<cmd>tabnew %<CR>', { desc = '[T]ab open current [B]uffer' })

keymap.set('n', '<left>', '<cmd>echo "Use h to move left"<CR>')
keymap.set('n', '<right>', '<cmd>echo "Use l to move right"<CR>')
keymap.set('n', '<up>', '<cmd>echo "Use k to move up"<CR>')
keymap.set('n', '<down>', '<cmd>echo "Use j to move down"<CR>')
