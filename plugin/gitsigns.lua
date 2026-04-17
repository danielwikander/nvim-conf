require('gitsigns').setup({
  signs = {
    add = { text = '▍' },
    change = { text = '▍' },
  },
})

vim.keymap.set('n', '<leader>w', '<cmd>Gitsigns preview_hunk_inline<CR>', { desc = 'Preview hunk inline' })
vim.keymap.set('n', '<leader>W', '<cmd>Gitsigns preview_hunk<CR>', { desc = 'Preview hunk' })
vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle git blame inline' })
vim.keymap.set('n', '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>', { desc = 'Reset git hunk' })
