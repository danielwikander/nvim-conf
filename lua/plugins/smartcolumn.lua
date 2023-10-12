return
{
    event = { 'BufReadPost', 'BufNewFile' },
    'm4xshen/smartcolumn.nvim',
    opts = {
        scope = 'line',
        disabled_filetypes = {
            'alpha',
            'dashboard',
            'help',
            'text',
            'markdown',
            'neo-tree',
            'lazy',
            'mason',
        }
    }
}

