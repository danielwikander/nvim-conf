return
{
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = 'Gitsigns',
    keys = {
        { '<leader>g', '<cmd>Gitsigns preview_hunk_inline<CR>', { desc = 'Preview hunk inline' } },
        { '<leader>G', '<cmd>Gitsigns preview_hunk<CR>',        { desc = 'Preview hunk' } },
        { '<leader>w', '<cmd>Gitsigns preview_hunk_inline<CR>', { desc = 'Preview hunk inline' } },
        { '<leader>W', '<cmd>Gitsigns preview_hunk<CR>',        { desc = 'Preview hunk' } },
    },
    config = function()
        require('gitsigns').setup()
    end
}
