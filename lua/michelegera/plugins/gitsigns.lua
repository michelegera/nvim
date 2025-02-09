-- gitsigns.nvim
-- https://github.com/lewis6991/gitsigns.nvim

return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    on_attach = function(bufnr)
      local gitsigns = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map('n', ']h', gitsigns.next_hunk, 'Next Hunk')
      map('n', '[h', gitsigns.prev_hunk, 'Prev Hunk')

      -- Stage and reset hunk
      map('n', '<leader>hs', gitsigns.stage_hunk, 'Git [s]tage hunk')
      map('n', '<leader>hr', gitsigns.reset_hunk, 'Git [r]eset hunk')
      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Git [S]tage hunk')
      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, 'Reset hunk')

      -- Stage and reset buffer
      map('n', '<leader>hS', gitsigns.stage_buffer, 'Git [S]tage buffer')
      map('n', '<leader>hR', gitsigns.reset_buffer, 'Git [r]eset buffer')

      -- Undo stage hunk
      map('n', '<leader>hu', gitsigns.undo_stage_hunk, 'Git [u]ndo stage hunk')

      -- Preview hunk
      map('n', '<leader>hp', gitsigns.preview_hunk, 'Git [p]review hunk')

      -- Blame line
      map('n', '<leader>hb', function()
        gitsigns.blame_line { full = true }
      end, 'Git [b]lame line')
      map('n', '<leader>hB', gitsigns.toggle_current_line_blame, 'Git toggle [B]lame line')

      -- Diff
      map('n', '<leader>hd', gitsigns.diffthis, 'Git [d]iff against index')
      map('n', '<leader>hD', function()
        gitsigns.diffthis '~'
      end, 'Git [D]iff against last commit')
    end,
  },
}
