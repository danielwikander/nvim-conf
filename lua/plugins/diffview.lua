return
{
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
        { '<C-g>',     '<CMD>DiffviewOpen<CR>',  mode = { 'n' } },
    },
    opts = {
        keymaps = {
            view = {
                ['<C-g>'] = '<CMD>DiffviewClose<CR>',
                ['<leader>1'] = '<CMD>DiffviewToggleFiles<CR>',
            },
            file_panel = {
                ['<C-g>'] = '<CMD>DiffviewClose<CR>',
                ['<leader>1'] = '<CMD>DiffviewToggleFiles<CR>',
            }
        }
    }
}
