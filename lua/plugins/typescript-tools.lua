return {
  'pmizio/typescript-tools.nvim',
  event = { 'BufReadPost *.ts,*.tsx,*.js,*.jsx', 'BufNewFile *.ts,*.tsx,*.js,*.jsx' },
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-lspconfig' },
  config = function()
    require('typescript-tools').setup({
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'literals',
          includeInlayVariableTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
        },
      },
    })
    vim.keymap.set('n', '<leader>o', '<cmd>TSToolsOrganizeImports<CR>', { desc = 'Organize imports' })
    vim.keymap.set('n', '<leader>O', '<cmd>TSToolsAddMissingImports<CR>', { desc = 'Add missing imports' })
    vim.keymap.set('n', '<leader>i', 'yiwoconsole.log();<left><left><esc>pb', { desc = 'Console log' })
    vim.keymap.set('v', '<leader>i', 'yoconsole.log();<left><left><esc>pb', { desc = 'Console log' })
  end,
}
