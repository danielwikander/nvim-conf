return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
        's1n7ax/nvim-window-picker'
    },
    keys = {
        { '<leader>1', '<cmd>Neotree toggle<CR>', desc = 'NeoTree'}
    },
    config = function()
        vim.g.loaded_netrw = 1 -- Disable netrw
        vim.g.loaded_netrwPlugin = 1
        require('neo-tree').setup({
            default_component_configs = {
                indent = {
                    with_markers = false
                },
                -- git_status = {
                --     symbols = false
                -- },
                symbols = {
                    -- Change type
                    added     = '+',
                    deleted   = '-',
                    modified  = '+',
                    renamed   = 'r',
                    -- Status type
                    untracked = '?',
                    ignored   = '',
                    unstaged  = '',
                    staged    = '',
                    conflict  = '',
                }
            },
            filesystem = {
                follow_current_file = true
            },
            window = {
                mappings = {
                    ['l'] = 'open',
                    ['w'] = 'open_with_window_picker',
                    ['h'] = 'close_node',
                },
            }
        })
    end
}
