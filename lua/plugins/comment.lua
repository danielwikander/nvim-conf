return
{
    'numToStr/Comment.nvim',
    keys = {
        { 'cc',  desc = 'Line comment' },
        { 'cc',  mode = 'v',            desc = 'Line comment visual mode' },
        { 'gbc', desc = 'Block comment' },
        { 'gbc', mode = 'v',            desc = 'Block comment visual mode' }
    },
    dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
        require('Comment').setup({
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
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
