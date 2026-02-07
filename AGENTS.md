# AGENTS.md - Neovim Configuration Guide for Coding Agents

This document provides coding agents with essential information about this Neovim configuration codebase.

## Project Overview

This is a personal Neovim configuration built with Lua, using lazy.nvim as the plugin manager. The configuration includes LSP support, formatting, linting, and various productivity plugins for modern development workflows.

## Project Structure

```
nvim/
├── init.lua                    # Entry point
├── lazy-lock.json              # Plugin version lockfile
└── lua/custom/
    ├── core/                   # Core configuration
    │   ├── init.lua           # Core module loader
    │   ├── globals.lua        # Global variables (leader keys, nerd font)
    │   ├── options.lua        # Vim options (tabs, search, UI, etc.)
    │   ├── keymaps.lua        # Global key mappings
    │   └── autocmd.lua        # Auto commands
    ├── lazy.lua               # lazy.nvim bootstrap and setup
    └── plugins/               # Plugin configurations
        ├── init.lua           # Basic plugins (plenary)
        ├── lsp/               # LSP-related plugins
        │   ├── lspconfig.lua  # LSP configuration and keymaps
        │   └── mason.lua      # LSP server installer
        ├── formatting.lua     # conform.nvim configuration
        ├── linting.lua        # nvim-lint configuration
        ├── nvim-cmp.lua      # Completion configuration
        ├── treesitter.lua    # Syntax highlighting
        └── [other plugins]    # UI, navigation, git, etc.
```

## Build/Lint/Test Commands

### Formatting
```bash
# Format Lua files with stylua (must be installed)
stylua lua/ --check                    # Check formatting
stylua lua/                            # Format all Lua files
stylua lua/custom/plugins/example.lua  # Format single file
```

### Linting
```bash
# No automated linting configured for Lua files in this config
# Neovim's LSP (lua_ls) provides diagnostics when running
```

### Testing
```bash
# No automated tests configured
# Manual testing: Open Neovim and verify plugins load correctly
nvim +checkhealth                      # Check Neovim health
nvim +"Lazy sync" +qa                  # Sync plugins
```

### Plugin Management
```bash
# Inside Neovim
:Lazy                    # Open plugin manager UI
:Lazy sync              # Install/update/clean plugins
:Lazy update            # Update all plugins
:Lazy clean             # Remove unused plugins
:checkhealth            # Check for issues
```

## Code Style Guidelines

### File Organization
- **Entry point**: `init.lua` requires core and lazy modules
- **Core config**: Place in `lua/custom/core/`
- **Plugin config**: Each plugin gets its own file in `lua/custom/plugins/`
- **Plugin structure**: Return a lazy.nvim plugin spec table

### Lua Conventions

#### Indentation and Formatting
- **Indent**: 2 spaces (enforced by .editorconfig and .stylua.toml)
- **Line endings**: LF (Unix)
- **Max line width**: 160 characters (stylua)
- **Quote style**: Single quotes preferred (auto-prefer single in stylua)
- **Call parentheses**: None for single string/table args
- **Final newline**: Required
- **Trailing whitespace**: Remove (except in markdown)

#### Imports and Requires
```lua
-- Group requires at the top of config functions
local plugin = require 'plugin-name'  -- Use single quotes
local util = require 'plugin.util'

-- For lazy.nvim plugin specs
return {
  'author/plugin-name',
  dependencies = { 'dep1', 'dep2' },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local plugin = require 'plugin-name'
    -- configuration here
  end,
}
```

#### Naming Conventions
- **Variables**: `snake_case` for local variables
- **Constants**: `UPPER_CASE` for constants (rare in this config)
- **Module names**: Match file paths (e.g., `require 'custom.core.options'`)
- **Functions**: `snake_case` for function names
- **Keymaps**: Use descriptive `desc` fields with mnemonic brackets `[X]`

#### Tables and Configuration
```lua
-- Prefer explicit table formatting
local config = {
  option1 = true,
  option2 = 'value',
  nested = {
    key = 'value',
  },
}

-- Vim options: use vim.opt
opt.number = true
opt.tabstop = 2

-- Globals: use vim.g
g.mapleader = ' '

-- API calls: use full module names
vim.api.nvim_create_autocmd('Event', { ... })
vim.keymap.set('n', 'key', 'action', { desc = 'Description' })
```

#### Comments
```lua
-- Single-line comments with space after --
-- Use comments to explain "why", not "what"

-- Plugin headers include name and URL
-- plugin-name
-- https://github.com/author/plugin-name
```

#### Error Handling
```lua
-- Check conditions before operations
if not (vim.uv or vim.loop).fs_stat(path) then
  error('Error message: ' .. details)
end

-- Check buffer modifiability before modifications
if vim.opt_local.modifiable:get() then
  -- perform modification
end
```

### Plugin Configuration Patterns

#### Standard Plugin File Structure
```lua
-- plugin-name
-- https://github.com/author/plugin-name

return {
  'author/plugin-name',
  event = { 'BufReadPre', 'BufNewFile' },  -- Lazy load when appropriate
  dependencies = {
    'dependency1',
    { 'dependency2', config = true },
  },
  config = function()
    local plugin = require 'plugin-name'
    
    plugin.setup {
      -- configuration options
    }
    
    -- Keymaps specific to this plugin
    vim.keymap.set('n', '<leader>x', function()
      plugin.action()
    end, { desc = 'Description' })
  end,
}
```

#### Keymapping Conventions
- **Leader key**: Space (`<leader>` = ` `)
- **Descriptions**: Always include descriptive `desc` fields
- **Mnemonic format**: Use `[X]` brackets in descriptions for key letters
  - Example: `'[S]plit [V]ertically'` for `<leader>sv`
- **Silent**: Use `silent = true` when appropriate
- **Buffer-local**: Use `buffer = bufnr` for LSP/filetype-specific maps

### LSP Configuration
- LSP setup happens in `lua/custom/plugins/lsp/lspconfig.lua`
- Use `LspAttach` autocmd for buffer-local LSP keymaps
- Prefer Telescope for LSP pickers (definitions, references, etc.)
- Diagnostic signs use nerd font icons

### Common Patterns

#### Auto Commands
```lua
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd('EventName', {
  desc = 'Description of what this does',
  group = augroup('group-name', { clear = true }),
  callback = function()
    -- action
  end,
})
```

#### Lazy Loading
- Use `event` for most plugins: `{ 'BufReadPre', 'BufNewFile' }`
- Use `keys` for plugins with specific keymaps
- Use `cmd` for command-based plugins
- Use `ft` for filetype-specific plugins

## Requirements and Dependencies

### System Requirements
- Neovim v0.9+ (uses vim.uv or vim.loop)
- Truecolor terminal emulator
- Nerd Font installed
- Ripgrep (for telescope grep)
- Node.js (for some LSP servers)
- Lazygit (optional, for git UI)

### External Tools (installed via Mason or system)
- **Formatters**: stylua, prettier, eslint_d
- **Linters**: markdownlint, eslint_d
- **LSP servers**: lua_ls, tsserver, etc.

## Common Tasks

### Adding a New Plugin
1. Create `lua/custom/plugins/plugin-name.lua`
2. Return lazy.nvim plugin spec table
3. Include plugin URL in comment header
4. Configure in `config` function
5. Restart Neovim and run `:Lazy sync`

### Modifying Keymaps
- Global keymaps: Edit `lua/custom/core/keymaps.lua`
- Plugin keymaps: Edit plugin's config file
- LSP keymaps: Edit `lua/custom/plugins/lsp/lspconfig.lua`

### Changing Vim Options
- Edit `lua/custom/core/options.lua`
- Use `vim.opt.option_name = value`

## Important Notes for Agents

- **DO NOT** modify `lazy-lock.json` directly (managed by lazy.nvim)
- **DO NOT** add comments inside table definitions (stylua will reformat)
- **ALWAYS** test changes by restarting Neovim
- **PREFER** existing patterns and structures in the codebase
- **USE** single quotes for strings (stylua auto-preference)
- **INCLUDE** plugin URLs in comment headers
- **MAINTAIN** 2-space indentation consistently
