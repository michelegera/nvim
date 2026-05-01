-- Suppress client.is_stopped deprecation until nvim-lspconfig, cmp-nvim-lsp,
-- and copilot-cmp update to the colon-method syntax required in Neovim 0.13
local _orig_deprecate = vim.deprecate
vim.deprecate = function(name, ...)
  if name == 'client.is_stopped' then return end
  return _orig_deprecate(name, ...)
end

vim.cmd 'let g:netrw_liststyle = 3'

local opt = vim.opt

opt.cursorline = true
opt.number = true
opt.relativenumber = true

opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.background = 'dark'
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.signcolumn = 'yes'
opt.termguicolors = true

opt.backspace = 'indent,eol,start'

vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

opt.splitbelow = true
opt.splitright = true

opt.breakindent = true
opt.inccommand = 'split'
opt.mouse = 'a'
opt.scrolloff = 10
opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
opt.showmode = false
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 250
