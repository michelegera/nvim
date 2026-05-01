local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('folke/lazydev.nvim'),
  gh('neovim/nvim-lspconfig'),
  -- cmp-nvim-lsp loaded here so capabilities are available; full cmp setup is in completion.lua
  gh('hrsh7th/cmp-nvim-lsp'),
  gh('antosha417/nvim-lsp-file-operations'),
  gh('mason-org/mason.nvim'),
  gh('williamboman/mason-lspconfig.nvim'),
  gh('WhoIsSethDaniel/mason-tool-installer.nvim'),
})

require('lazydev').setup({
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
})

require('lsp-file-operations').setup()

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, silent = true, desc = 'LSP: ' .. desc })
    end

    local buf = vim.lsp.buf
    local builtin = require('telescope.builtin')
    local diagnostic = vim.diagnostic

    map('gD', buf.declaration, '[G]oto [D]eclaration')
    map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
    map('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
    map('gr', builtin.lsp_references, '[G]oto [R]eferences')

    map('<leader>bd', '<cmd>Telescope diagnostics bufnr=0<CR>', 'Show [B]uffer [D]iagnostics')
    map('<leader>ca', buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
    map('<leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')
    map('<leader>d', diagnostic.open_float, 'Show [L]ine [D]iagnostics')
    map('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
    map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    map('[d', diagnostic.goto_prev, 'Goto previous diagnostic')
    map(']d', diagnostic.goto_next, 'Goto next diagnostic')
    map('K', buf.hover, '[K] Show documentation for what is under cursor')
  end,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN]  = ' ',
      [vim.diagnostic.severity.HINT]  = '󰠠 ',
      [vim.diagnostic.severity.INFO]  = ' ',
    },
  },
})

local capabilities = vim.tbl_deep_extend('force',
  vim.lsp.protocol.make_client_capabilities(),
  require('cmp_nvim_lsp').default_capabilities(),
  require('lsp-file-operations').default_capabilities()
)

require('mason').setup({
  ui = {
    icons = {
      package_installed = '✔️',
      package_pending = '→',
      package_uninstalled = '✖️',
    },
  },
})

require('mason-lspconfig').setup({
  ensure_installed = {
    'cssls',
    'emmet_ls',
    'eslint',
    'graphql',
    'html',
    'jsonls',
    'lua_ls',
    'ruby_lsp',
    'ts_ls',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({ capabilities = capabilities })
    end,
    ['lua_ls'] = function()
      require('lspconfig').lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            completion = { callSnippet = 'Replace' },
          },
        },
      })
    end,
  },
})

require('mason-tool-installer').setup({
  ensure_installed = {
    'prettier',
    'stylua',
    { 'eslint_d', version = '13.1.2' },
  },
})
