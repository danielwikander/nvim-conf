return
{
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        require('ibl').setup {
            show_current_context = true,
            indent = {
                highlight = { "IndentBlankLineChar" }
            },
            scope = {
                show_start = false
            }
        }
    end
}
