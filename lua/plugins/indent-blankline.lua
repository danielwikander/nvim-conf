return
{
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        require('indent_blankline').setup {
            show_current_context = true
        }
    end
}
