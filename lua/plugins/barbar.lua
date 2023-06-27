return
{
    'romgrk/barbar.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "BufReadPost",
    config = function()
        require('bufferline').setup({
            animation = false,
            auto_hide = true,
            icons = {
                button = '',
                modified = {
                    button = ''
                }
            },
            sidebar_filetypes = {
                ['neo-tree'] = { event = 'BufWipeout' },
            }
        })
    end
}
