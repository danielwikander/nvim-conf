return
{
    event = {'BufReadPost', 'BufNewFile'},
    'm4xshen/smartcolumn.nvim',
    opts = {
        scope = 'line',
        disabled_filetypes = {
            'help',
            'text',
            'markdown',
            'neo-tree',
            'lazy',
            'mason',
        }
    }
}
