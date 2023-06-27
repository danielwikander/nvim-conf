return
{
    keys = {
        { 'u',     desc = 'Undo' },
        { '<C-r>', desc = 'Redo' }
    },
    'tzachar/highlight-undo.nvim',
    config = function()
        require('highlight-undo').setup()
    end
}
