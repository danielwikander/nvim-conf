return {
    'akinsho/toggleterm.nvim',
    keys = {
        { '<C-t>', '<cmd>ToggleTerm<cr>',            mode = { 'n', 't' }, desc = 'Toggle terminal' },
        { '<C-g>', '<cmd>lua _lazygit_toggle()<CR>', mode = { 'n', 't' }, desc = 'Toggle lazygit' },
    },
    config = function()
        require('toggleterm').setup({
            open_mapping = [[<C-t>]]
        })
        local terminal = require('toggleterm.terminal').Terminal
        local lazygit  = terminal:new({
            cmd = 'lazygit',
            dir = 'git_dir',
            direction = 'float',
            float_opts = {
                border = 'none',
            },
            -- function to run on opening the terminal
            on_open = function(term)
                vim.cmd('startinsert!')
                vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, 'n', '<leader>g', '<cmd>close<CR>',
                    { noremap = true, silent = true })
            end,
            -- function to run on closing the terminal
            on_close = function()
                vim.cmd('startinsert!')
            end,
        })
        function _lazygit_toggle()
            lazygit:toggle()
        end
    end
}
