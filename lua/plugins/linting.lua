local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('mfussenegger/nvim-lint'),
})

local lint = require('lint')

-- Linters that always apply to a filetype (no project detection needed).
lint.linters_by_ft = {
  markdown = { 'markdownlint' },
}

-- JS/TS linters are resolved per-project below.
local js_ft = {
  javascript = true,
  javascriptreact = true,
  typescript = true,
  typescriptreact = true,
}

-- Checked in order; first match wins so only one linter runs per project.
local js_detectors = {
  { linter = 'biomejs', configs = { 'biome.json', 'biome.jsonc' }, deps = { '@biomejs/biome' } },
  { linter = 'oxlint', configs = { 'oxlint.json', '.oxlintrc.json' }, deps = { 'oxlint' } },
  {
    linter = 'eslint_d',
    configs = {
      'eslint.config.js',
      'eslint.config.mjs',
      'eslint.config.cjs',
      'eslint.config.ts',
      '.eslintrc',
      '.eslintrc.js',
      '.eslintrc.cjs',
      '.eslintrc.json',
      '.eslintrc.yml',
      '.eslintrc.yaml',
    },
    deps = { 'eslint' },
  },
}

local function root(bufnr)
  return vim.fs.root(bufnr, { '.git' }) or vim.uv.cwd()
end

-- vim.fs.find's `stop` is exclusive, so stop at the root's parent to include
-- config files that live at the project root itself.
local function search_stop(bufnr)
  return vim.fn.fnamemodify(root(bufnr), ':h')
end

local function find_config(bufnr, names)
  return vim.fs.find(names, {
    path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)),
    upward = true,
    stop = search_stop(bufnr),
    limit = 1,
  })[1] ~= nil
end

local function nearest_pkg(bufnr)
  local file = vim.fs.find('package.json', {
    path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)),
    upward = true,
    stop = search_stop(bufnr),
    limit = 1,
  })[1]
  if not file then
    return nil
  end
  local f = io.open(file)
  if not f then
    return nil
  end
  local ok, json = pcall(vim.json.decode, f:read('*a'))
  f:close()
  return ok and json or nil
end

local function has_dep(pkg, names)
  if not pkg then
    return false
  end
  for _, field in ipairs({ 'dependencies', 'devDependencies', 'peerDependencies' }) do
    local deps = pkg[field]
    if deps then
      for _, n in ipairs(names) do
        if deps[n] then
          return true
        end
      end
    end
  end
  return false
end

local function js_linters(bufnr)
  local pkg = nearest_pkg(bufnr)
  for _, d in ipairs(js_detectors) do
    if find_config(bufnr, d.configs) or has_dep(pkg, d.deps) then
      return { d.linter }
    end
  end
  return {}
end

local function resolve(bufnr)
  if js_ft[vim.bo[bufnr].filetype] then
    return js_linters(bufnr)
  end
  return lint.linters_by_ft[vim.bo[bufnr].filetype]
end

local lint_timer = assert(vim.uv.new_timer())
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = vim.api.nvim_create_augroup('lint', { clear = true }),
  callback = function(event)
    local bufnr = event.buf
    lint_timer:stop()
    lint_timer:start(100, 0, vim.schedule_wrap(function()
      if not vim.api.nvim_buf_is_valid(bufnr) then
        return
      end
      local names = resolve(bufnr)
      if names and #names > 0 then
        lint.try_lint(names, { bufnr = bufnr })
      end
    end))
  end,
})

vim.keymap.set('n', '<leader>l', function()
  if vim.opt_local.modifiable:get() then
    local names = resolve(0)
    if names and #names > 0 then
      lint.try_lint(names)
    end
  end
end, { desc = 'Trigger linting for current file' })
