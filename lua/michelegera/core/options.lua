vim.cmd 'let g:netrw_liststyle = 3' -- Set netrw to tree-style listing

local opt = vim.opt

-- Line numbers and cursor line
opt.cursorline = true -- Highlight the current line
opt.number = true -- Show absolute line numbers
opt.relativenumber = true -- Show relative line numbers

-- Wrapping and indentation
opt.autoindent = true -- Copy indent from current line when starting a new line
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
opt.tabstop = 2 -- Number of spaces a tab counts for
opt.wrap = false -- Disable line wrapping

-- Search settings
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Override ignorecase if search pattern contains uppercase letters

-- Appearance settings
opt.background = 'dark' -- Set background color to dark
opt.list = true -- Show whitespace characters
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- Define whitespace characters
opt.signcolumn = 'yes' -- Always show the sign column
opt.termguicolors = true -- Enable 24-bit RGB color in the TUI

-- Backspace behavior
opt.backspace = 'indent,eol,start' -- Allow backspace over everything in insert mode

-- Clipboard settings
vim.schedule(function() -- Schedule the setting after `UiEnter` because it can increase startup-time.
  opt.clipboard = 'unnamedplus' -- Use the system clipboard
end)

-- Window splitting behavior
opt.splitbelow = true -- Split horizontal windows below
opt.splitright = true -- Split vertical windows to the right

-- Miscellaneous settings
opt.breakindent = true -- Enable break indent
opt.inccommand = 'split' -- Preview substitutions as you type
opt.mouse = 'a' -- Enable mouse mode
opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor
opt.showmode = false -- Don't show the mode, since it's already in the status line
opt.timeoutlen = 300 -- Decrease mapped sequence wait time
opt.undofile = true -- Save undo history
opt.updatetime = 250 -- Decrease update time
