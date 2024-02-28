return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '=',
      '',
      mode = { 'n', 'v' },
      desc = 'Format',
    },
    {
      '==',
      function()
        require('conform').format({
          lsp_fallback = true,
          async = true,
          timeout_ms = 1000,
        })
      end,
      mode = '',
      desc = 'Format file or selection',
    },
  },
  config = function()
    require('conform').setup({
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return {
          timeout_ms = 500,
          lsp_fallback = true,
          async = true,
        }
      end,
      formatters_by_ft = {
        javascript = { { 'prettierd', 'prettier' } },
        typescript = { { 'prettierd', 'prettier' } },
        javascriptreact = { { 'prettierd', 'prettier' } },
        typescriptreact = { { 'prettierd', 'prettier' } },
        svelte = { { 'prettierd', 'prettier' } },
        css = { { 'prettierd', 'prettier' } },
        html = { { 'prettierd', 'prettier' } },
        json = { { 'prettierd', 'prettier' } },
        yaml = { { 'prettierd', 'prettier' } },
        markdown = { { 'prettierd', 'prettier' } },
        graphql = { { 'prettierd', 'prettier' } },
        lua = { 'stylua' },
        rust = { 'rustfmt' },
      },
    })
  end,
}
