vim.cmd 'let g:netrw_liststyle = 3' -- Set netrw to tree-style listing

local opt = vim.opt

-- Line numbers and cursor line
opt.cursorline = true -- Highlight the current line
opt.number = true -- Show absolute line numbers
opt.relativenumber = true -- Show relative line numbers
opt.wrap = false -- Disable line wrapping

-- Indentation settings
opt.autoindent = true -- Copy indent from current line when starting a new line
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
opt.tabstop = 2 -- Number of spaces a tab counts for

-- Search settings
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Override ignorecase if search pattern contains uppercase letters

-- Appearance settings
opt.background = 'dark' -- Set background color to dark
opt.signcolumn = 'yes' -- Always show the sign column
opt.termguicolors = true -- Enable 24-bit RGB color in the TUI

-- Backspace behavior
opt.backspace = 'indent,eol,start' -- Allow backspace over everything in insert mode

-- Clipboard settings
opt.clipboard:append 'unnamedplus' -- Use the system clipboard

-- Window splitting behavior
opt.splitright = true -- Split vertical windows to the right
opt.splitbelow = true -- Split horizontal windows below
