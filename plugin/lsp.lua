require('mason').setup({
  ui = { icons = { package_installed = '●', package_uninstalled = '○', package_pending = '➜' } },
})

require('nvim-eslint').setup({})

require('mason-tool-installer').setup({
  ensure_installed = { 'prettier', 'prettierd', 'stylua' },
})

require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = { 'cssls', 'eslint', 'html', 'jsonls', 'lua_ls', 'graphql', 'tsgo', 'yamlls' },
})

vim.lsp.config('*', { capabilities = vim.lsp.protocol.make_client_capabilities() })

vim.keymap.set('n', '<leader>M', '<cmd>Mason<CR>', { desc = 'Mason' })
