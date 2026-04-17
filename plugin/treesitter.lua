vim.cmd.packadd('nvim-treesitter')
vim.opt.runtimepath:append(vim.fn.stdpath('data') .. '/site/pack/core/opt/nvim-treesitter/runtime')

require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = true,
  },
})

require('ts-error-translator').setup({
  auto_attach = true,
  servers = { 'astro', 'svelte', 'ts_ls', 'tsserver', 'typescript-tools', 'volar', 'vtsls', 'tsgo' },
})

local ts = require('nvim-treesitter')

local languages = {
  'bash', 'comment', 'css', 'diff',
  'git_config', 'git_rebase', 'gitcommit', 'gitignore',
  'html', 'javascript', 'json', 'latex', 'lua', 'luadoc', 'make',
  'markdown', 'markdown_inline', 'python', 'query', 'regex', 'rust',
  'scss', 'svelte', 'toml', 'tsx', 'typescript', 'typst',
  'vim', 'vimdoc', 'vue', 'xml',
}

local isnt_installed = function(lang)
  return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
end

local to_install = vim.tbl_filter(isnt_installed, languages)
if #to_install > 0 then
  ts.install(to_install, { max_jobs = 8 })
end

local pre_installed_parsers = { 'c', 'lua', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }

local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = group,
  callback = function(args)
    local treesitter = require('nvim-treesitter')
    local lang = vim.treesitter.language.get_lang(args.match)
    if vim.list_contains(treesitter.get_available(), lang) then
      if
        not vim.list_contains(treesitter.get_installed(), lang)
        and not vim.list_contains(pre_installed_parsers, lang)
      then
        treesitter.install(lang):wait()
      end
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.treesitter.start(args.buf)
    end
  end,
  desc = 'Enable nvim-treesitter and install parser if not installed',
})

-- ts-node-action
vim.keymap.set('n', '<leader>j', function() require('ts-node-action').node_action() end, { desc = 'Node action' })
