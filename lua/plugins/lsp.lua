return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  enabled = true,
  dependencies = {
    {
      'williamboman/mason.nvim',
      lazy = true,
      cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUpdate' },
      keys = {
        {
          '<leader>M',
          '<cmd>Mason<CR>',
          desc = 'Mason',
        },
      },
      opts = {
        ui = {
          icons = {
            package_installed = '●',
            package_uninstalled = '○',
            package_pending = '➜',
          },
        },
      },
    },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'nvim-lua/plenary.nvim',
    'saghen/blink.cmp',
    'b0o/schemastore.nvim',
    'yioneko/nvim-vtsls',
    'esmuellert/nvim-eslint',
  },
  config = function()
    require('nvim-eslint').setup({})

    require('mason-tool-installer').setup({
      ensure_installed = {
        'eslint',
        'jsonls',
        'prettier',
        'prettierd',
        'stylua',
        'vtsls',
        'yamlls',
      },
    })

    require('mason-lspconfig').setup({
      automatic_installation = true,
      ensure_installed = {
        'cssls',
        'eslint',
        'html',
        'jsonls',
        'lua_ls',
        'graphql',
        'vtsls',
        'yamlls',
      },
    })

    vim.lsp.config('*', {
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    })
  end,
}
