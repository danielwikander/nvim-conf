return
{
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
        { '<C-g>', '<CMD>DiffviewOpen<CR>', desc = 'Open diffview' },
    },
    opts = {
        keymaps = {
            view = {
                ['<C-g>'] = '<CMD>DiffviewClose<CR>',
                ['<leader><tab>'] = '<CMD>DiffviewToggleFiles<CR>',
            },
            file_panel = {
                ['<C-g>'] = '<CMD>DiffviewClose<CR>',
                ['<leader><tab>'] = '<CMD>DiffviewToggleFiles<CR>',
            }
        }
    }
}
