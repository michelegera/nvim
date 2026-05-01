local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('nvim-lua/plenary.nvim'),
  gh('nvim-telescope/telescope.nvim'),
  -- After first install, build the native fzf sorter manually:
  --   :!cd ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim && make
  gh('nvim-telescope/telescope-fzf-native.nvim'),
})

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    path_display = { 'smart' },
    mappings = {
      i = {
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
})

-- fzf-native requires manual build on first install:
--   :!cd ~/.local/share/nvim-0.12/site/pack/core/opt/telescope-fzf-native.nvim && make
pcall(telescope.load_extension, 'fzf')

local keymap = vim.keymap
local builtin = require('telescope.builtin')

keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' })
keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files' })
keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
