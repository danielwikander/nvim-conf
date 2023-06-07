return
{
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
        {
            's1n7ax/nvim-window-picker',
            config = function()
                require 'window-picker'.setup({
                    autoselect_one = true,
                    include_current = false,
                    filter_rules = {
                        -- filter using buffer options
                        bo = {
                            -- if the file type is one of following, the window will be ignored
                            filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
                            -- if the buffer type is one of following, the window will be ignored
                            buftype = { 'terminal', 'quickfix' },
                        },
                    },
                    other_win_hl_color = '#e35e4f',
                })
            end
        }
    },
    keys = {
        { '<leader>1', '<cmd>Neotree toggle<CR>', desc = 'NeoTree' }
    },
    config = function()
        vim.g.loaded_netrw = 1 -- Disable netrw
        vim.g.loaded_netrwPlugin = 1

        require('neo-tree').setup({
            default_component_configs = {
                indent = {
                    with_markers = false
                },
                modified = {
                    symbol = '+',
                    highlight = 'NeoTreeModified'
                },
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
                },
                git_status = {
                    symbols = {
                        added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted   = "X", -- this can only be used in the git_status source
                        renamed   = "r", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "",
                        ignored   = "",
                        unstaged  = "",
                        staged    = "",
                        conflict  = "C",
                    }
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
                }
            }
        })
    end
}
