return {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('gitsigns').setup {
            vim.keymap.set('n', '<leader>g', '<cmd>Gitsigns preview_hunk_inline<CR>', { noremap = true, silent = true });
            vim.keymap.set('n', '<leader>G', '<cmd>Gitsigns preview_hunk<CR>', { noremap = true, silent = true });
            vim.keymap.set('n', '<leader>w', '<cmd>Gitsigns preview_hunk_inline<CR>', { noremap = true, silent = true });
            vim.keymap.set('n', '<leader>W', '<cmd>Gitsigns preview_hunk<CR>', { noremap = true, silent = true })
        }
    end
}

