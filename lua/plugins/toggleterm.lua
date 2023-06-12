return {
    'akinsho/toggleterm.nvim',
    keys = {
        { '<C-t>', '<cmd>ToggleTerm<cr>', mode = 'n', desc = 'Toggle terminal' },
        { '<C-t>', '<cmd>ToggleTerm<cr>', mode = 't', desc = 'Toggle terminal' }
    },
    config = function()
        require('toggleterm').setup({
            open_mapping = [[<C-t>]]
        })
    end
}
