return
{
    'j-hui/fidget.nvim',
    tag = 'legacy', -- Until j-hui has finished the rewrite
    event = { 'BufReadPre', 'BufNewFile' },
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
