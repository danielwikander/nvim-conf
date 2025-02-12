return {
  'mfussenegger/nvim-lint',
  lazy = true,
  enabled = false, -- Disabled for now because eslint-lsp handles this already
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      graphql = { 'eslint_d' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({
      'BufEnter',
      'BufWritePost',
      'InsertLeave',
      'QuickFixCmdPost',
    }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set('n', '<leader>l', function()
      lint.try_lint()
    end, {
      desc = 'Lint file',
    })
  end,
}
