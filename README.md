# nvim

Personal Neovim configuration built on the built-in `vim.pack` plugin manager — no lazy.nvim, no bootstrapping scripts.

## Requirements

| Dependency | Purpose |
|---|---|
| [Neovim](https://neovim.io) 0.12+ | Required |
| [Nerd Font](https://www.nerdfonts.com) | Icons throughout the UI |
| [git](https://git-scm.com) | vim.pack plugin installation |
| [Node.js](https://nodejs.org) | LSP servers via mason |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Telescope live grep |
| [fd](https://github.com/sharkdp/fd) | Telescope file search |
| [lazygit](https://github.com/jesseduffield/lazygit) | LazyGit integration |
| [prettier](https://prettier.io) / [stylua](https://github.com/JohnnyMorganz/StyLua) | Formatters (also installable via mason) |

## Installation

```sh
# Clone into your Neovim config directory
git clone https://github.com/michelegera/nvim ~/.config/nvim

# Or use NVIM_APPNAME to run alongside an existing config
git clone https://github.com/michelegera/nvim ~/.config/nvim-alt
NVIM_APPNAME=nvim-alt nvim
```

Plugins are installed automatically on first launch. After that, two steps require a manual build:

```vim
" 1. Build the fzf native sorter for Telescope
:!cd ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim && make

" 2. Install jsregexp support for LuaSnip
:!cd ~/.local/share/nvim/site/pack/core/opt/LuaSnip && make install_jsregexp

" 3. Install treesitter parsers
:TSUpdate
```

LSP servers and tools are installed via `:Mason` or automatically on first open of a relevant file.

## Updating plugins

```vim
:PackUpdate
```

Review the diff shown in the confirmation buffer, then `:w` to apply or `:q` to cancel.

## Structure

```
├── init.lua              Entry point
└── lua/
    ├── core/
    │   ├── globals.lua   Leader key, Nerd Font flag
    │   ├── options.lua   vim.opt settings
    │   ├── keymaps.lua   Plugin-independent keymaps
    │   ├── autocmds.lua  Highlight on yank
    │   └── commands.lua  User commands (PackUpdate, …)
    └── plugins/
        ├── appearance.lua   Colorscheme, statusline, tabline, indent guides
        ├── ui.lua           which-key, noice, nvim-notify
        ├── telescope.lua    Fuzzy finder
        ├── treesitter.lua   Syntax, indentation, incremental selection
        ├── git.lua          Gitsigns, LazyGit
        ├── editing.lua      Autopairs, surround, flash, substitute
        ├── lsp.lua          LSP, Mason, lazydev
        ├── formatting.lua   conform.nvim
        ├── linting.lua      nvim-lint
        ├── completion.lua   nvim-cmp, LuaSnip
        ├── ai.lua           Claude Code, snacks
        ├── neotree.lua      File explorer
        └── session.lua      Sessions, splits, diagnostics, todos
```

## Plugins

### Appearance
| Plugin | Description |
|---|---|
| [moonlight.nvim](https://github.com/michelegera/moonlight.nvim) | Colorscheme |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Tab line |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File icons |

### UI
| Plugin | Description |
|---|---|
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints |
| [noice.nvim](https://github.com/folke/noice.nvim) | UI for messages, cmdline, popupmenu |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | Notification manager |

### Navigation
| Plugin | Description |
|---|---|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | Native fzf sorter |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |
| [flash.nvim](https://github.com/folke/flash.nvim) | Jump anywhere |

### Editing
| Plugin | Description |
|---|---|
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Surround motions |
| [substitute.nvim](https://github.com/gbprod/substitute.nvim) | Substitute operator |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) | Auto-close HTML tags |

### LSP & Tooling
| Plugin | Description |
|---|---|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configurations |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | LSP/tool installer |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Mason + lspconfig bridge |
| [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Auto-install formatters/linters |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim) | Lua type hints for Neovim config |
| [nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations) | LSP-aware file rename/move |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Linting |

### Completion
| Plugin | Description |
|---|---|
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet collection |
| [lspkind.nvim](https://github.com/onsails/lspkind.nvim) | Completion item icons |

### Git
| Plugin | Description |
|---|---|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git hunk indicators and actions |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | LazyGit integration |

### AI
| Plugin | Description |
|---|---|
| [claudecode.nvim](https://github.com/coder/claudecode.nvim) | Claude Code integration |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | UI backend for claudecode |

### Session & Window Management
| Plugin | Description |
|---|---|
| [auto-session](https://github.com/rmagatti/auto-session) | Session save/restore |
| [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim) | Split navigation and resizing |
| [vim-maximizer](https://github.com/szw/vim-maximizer) | Maximize/restore splits |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics list |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight and navigate TODOs |
| [diagflow.nvim](https://github.com/dgagn/diagflow.nvim) | Inline diagnostic display |
| [inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim) | Incremental rename |

## Keymaps

Leader key is `<Space>`.

### General

| Key | Action |
|---|---|
| `jk` | Exit insert mode |
| `<C-s>` | Save file |
| `<Esc>` | Clear search highlights |
| `<leader>+` / `<leader>-` | Increment / decrement number |

### Splits

| Key | Action |
|---|---|
| `<leader>sv` | Split vertically |
| `<leader>sh` | Split horizontally |
| `<leader>se` | Equalize split sizes |
| `<leader>sc` | Close split |
| `<leader>sm` | Maximize / restore split |
| `<C-h/j/k/l>` | Move cursor to split |
| `<A-h/j/k/l>` | Resize split |
| `<C-A-h/j/k/l>` | Swap buffer with adjacent split |

### Tabs

| Key | Action |
|---|---|
| `<Tab>` / `<S-Tab>` | Next / previous tab |
| `<leader>to` | Open new tab |
| `<leader>tb` | Open current buffer in new tab |
| `<leader>tx` | Close tab |
| `<leader>tn` / `<leader>tp` | Next / previous tab |

### Telescope

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fw` | Grep current word |
| `<leader>fr` | Resume last search |
| `<leader>fh` | Help tags |
| `<leader>fk` | Keymaps |
| `<leader>fd` | Diagnostics |
| `<leader>fs` | Select Telescope picker |
| `<leader>f.` | Recent files |
| `<leader><leader>` | Open buffers |
| `<leader>/` | Fuzzy search in current buffer |

### LSP

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gI` | Go to implementation |
| `gr` | References |
| `K` | Show documentation |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename (incremental) |
| `<leader>D` | Type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<leader>d` | Line diagnostics |
| `<leader>bd` | Buffer diagnostics |
| `[d` / `]d` | Previous / next diagnostic |

### Git

| Key | Action |
|---|---|
| `]h` / `[h` | Next / previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hR` | Reset buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hB` | Toggle line blame |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |
| `<leader>lg` | Open LazyGit |

### Navigation

| Key | Action |
|---|---|
| `\` | Reveal current file in Neo-tree |
| `s` | Flash jump |
| `S` | Flash Treesitter jump |
| `r` | Flash remote (operator-pending) |
| `R` | Flash Treesitter search |

### Editing

| Key | Action |
|---|---|
| `gs` | Substitute with motion |
| `gss` | Substitute line |
| `gS` | Substitute to end of line |
| `gs` (visual) | Substitute selection |

### Formatting & Linting

| Key | Action |
|---|---|
| `<leader>mp` | Format file or range |
| `<leader>l` | Trigger linting |

### Diagnostics & TODOs

| Key | Action |
|---|---|
| `<leader>xw` | Workspace diagnostics (Trouble) |
| `<leader>xd` | Document diagnostics (Trouble) |
| `<leader>xq` | Quickfix list (Trouble) |
| `<leader>xl` | Location list (Trouble) |
| `<leader>xt` | TODOs (Trouble) |
| `]t` / `[t` | Next / previous TODO |

### Session

| Key | Action |
|---|---|
| `<leader>wr` | Restore session for cwd |
| `<leader>ws` | Save session |

### Claude Code

| Key | Action |
|---|---|
| `<leader>ac` | Toggle Claude Code |
| `<leader>af` | Focus Claude Code |
| `<leader>ar` | Resume last session |
| `<leader>aC` | Continue conversation |
| `<leader>am` | Select model |
| `<leader>ab` | Add current buffer |
| `<leader>as` | Send selection to Claude (visual) / Add file (file tree) |
| `<leader>aa` | Accept diff |
| `<leader>ad` | Deny diff |
