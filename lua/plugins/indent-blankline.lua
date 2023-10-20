return
{
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        require('ibl').setup {
            scope = {
                show_start = false,
                include = {
                    node_type = {
                        ['*'] = { '*' }
                    }
                }
            }
        }
    end
}
