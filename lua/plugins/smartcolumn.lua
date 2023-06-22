return
{
    event = {'BufReadPost', 'BufNewFile'},
    'm4xshen/smartcolumn.nvim',
    opts = {
        scope = 'line',
        disabled_filetypes = {
            'alpha',
            'help',
            'text',
            'markdown',
            'neo-tree',
            'lazy',
            'mason',
        }
    }
}
