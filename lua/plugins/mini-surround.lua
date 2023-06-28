return
{
    'echasnovski/mini.surround',
    event = 'BufReadPost',
    version = false,
    config = function()
        require('mini.surround').setup({
            mappings = {
                add = 'ys',          -- Add surrounding in Normal and Visual modes
                delete = 'ds',       -- Delete surrounding
                find = '',           -- Find surrounding (to the right)
                find_left = '',      -- Find surrounding (to the left)
                highlight = '',      -- Highlight surrounding
                replace = 'cs',      -- Replace surrounding
                update_n_lines = '', -- Update `n_lines`

                suffix_last = '',    -- Suffix to search with "prev" method
                suffix_next = '',    -- Suffix to search with "next" method
            },
        })

        -- Remap adding surrounding to Visual mode selection
        vim.keymap.del('x', 'ys')
        vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

        -- Make special mapping for "add surrounding for line"
        vim.keymap.set('n', 'yss', 'ys_', { remap = true })
    end
}
