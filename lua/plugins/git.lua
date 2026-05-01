local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('nvim-lua/plenary.nvim'),
  gh('lewis6991/gitsigns.nvim'),
  gh('kdheepak/lazygit.nvim'),
})

require('gitsigns').setup({
  on_attach = function(bufnr)
    local gitsigns = package.loaded.gitsigns

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
    end

    map('n', ']h', gitsigns.next_hunk, 'Next Hunk')
    map('n', '[h', gitsigns.prev_hunk, 'Prev Hunk')

    map('n', '<leader>hs', gitsigns.stage_hunk, 'Git [s]tage hunk')
    map('n', '<leader>hr', gitsigns.reset_hunk, 'Git [r]eset hunk')
    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, 'Git [S]tage hunk')
    map('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, 'Reset hunk')

    map('n', '<leader>hS', gitsigns.stage_buffer, 'Git [S]tage buffer')
    map('n', '<leader>hR', gitsigns.reset_buffer, 'Git [r]eset buffer')
    map('n', '<leader>hu', gitsigns.undo_stage_hunk, 'Git [u]ndo stage hunk')
    map('n', '<leader>hp', gitsigns.preview_hunk, 'Git [p]review hunk')

    map('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end, 'Git [b]lame line')
    map('n', '<leader>hB', gitsigns.toggle_current_line_blame, 'Git toggle [B]lame line')

    map('n', '<leader>hd', gitsigns.diffthis, 'Git [d]iff against index')
    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end, 'Git [D]iff against last commit')
  end,
})

vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = 'Open Lazygit' })
