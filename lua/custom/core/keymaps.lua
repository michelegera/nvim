local keymap = vim.keymap

-- Exit insert mode and save quickly
keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode' })
keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

-- Clear search highlights
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Increment and decrement numbers
keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

-- Split window management
keymap.set('n', '<leader>sv', '<C-w>v', { desc = '[S]plit [V]ertically' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = '[S]plit [H]orizontally' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = '[S]plit [E]qual size' })
keymap.set('n', '<leader>sc', '<cmd>close<CR>', { desc = '[S]plit [C]lose' })

-- Tab management
keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = '[T]ab open' })
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = '[T]ab [C]lose' })
keymap.set('n', '<leader>tn', '<cmd>tabnext<CR>', { desc = '[T]ab [N]ext' })
keymap.set('n', '<leader>tp', '<cmd>tabprevious<CR>', { desc = '[T]ab [P]revious' })
keymap.set('n', '<leader>tb', '<cmd>tabnew %<CR>', { desc = '[T]ab open current [B]uffer' })

-- Disable arrow keys
keymap.set('n', '<left>', '<cmd>echo "Use h to move left"<CR>', { desc = 'Disable left arrow' })
keymap.set('n', '<right>', '<cmd>echo "Use l to move right"<CR>', { desc = 'Disable right arrow' })
keymap.set('n', '<up>', '<cmd>echo "Use k to move up"<CR>', { desc = 'Disable up arrow' })
keymap.set('n', '<down>', '<cmd>echo "Use j to move down"<CR>', { desc = 'Disable down arrow' })
