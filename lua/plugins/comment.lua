return
{
    'numToStr/Comment.nvim',
    keys = {
        { 'cc',  desc = 'Line comment' },
        { 'cc',  mode = 'v',            desc = 'Line comment visual mode' },
        { 'gbc', desc = 'Block comment' },
        { 'gbc', mode = 'v',            desc = 'Block comment visual mode' }
    },
    config = function()
        require('Comment').setup({
            toggler = {
                line = 'cc',
                block = 'gbc'
            },
            opleader = {
                line = 'cc',
                block = 'gbc'
            },
            mappings = {
                basic = true
            }
        })
    end
}
