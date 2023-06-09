return
{
    'j-hui/fidget.nvim',
    event = {'BufReadPre', 'BufNewFile'},
    config = function()
        require('fidget').setup {
            text = {
                spinner = 'dots',
                done = ''
            },
            align = {
                bottom = false
            },
            fmt = {
                stack_upwards = false
            }
        }
    end
}
