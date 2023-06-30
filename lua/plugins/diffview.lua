return
{
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
        { '<leader>8', '<CMD>DiffviewOpen<CR>', desc = 'Open diffview' },
    },
    opts = {
        keymaps = {
            view = {
                ['<leader>8'] = '<CMD>DiffviewClose<CR>',
                ['<leader><tab>'] = '<CMD>DiffviewToggleFiles<CR>',
            },
            file_panel = {
                ['<leader>8'] = '<CMD>DiffviewClose<CR>',
                ['<leader><tab>'] = '<CMD>DiffviewToggleFiles<CR>',
            }
        }
    }
}
