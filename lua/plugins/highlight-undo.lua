return
{
    keys = {
        { 'u' },
        { '<C-r>' }
    },
    'tzachar/highlight-undo.nvim',
    config = function()
        require('highlight-undo').setup()
    end
}
