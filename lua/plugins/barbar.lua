return
{
    'romgrk/barbar.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'BufReadPost',
    keys = {
        { '<leader>q', '<CMD>BufferClose<CR>',              desc = 'Close buffer' },
        { '<leader>Q', '<CMD>BufferCloseAllButVisible<CR>', desc = 'Close all buffers except visible' },
        { '<S-h>',     '<CMD>BufferPrevious<CR>',           desc = 'Navigate to previous buffer' },
        { '<S-l>',     '<CMD>BufferNext<CR>',               desc = 'Navigate to previous buffer' },
    },
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
