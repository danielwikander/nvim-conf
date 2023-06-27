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
                        bo = {
                            filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
                            buftype = { 'terminal', 'quickfix' },
                        },
                    },
                    other_win_hl_color = '#e35e4f',
                })
            end
        }
    },
    keys = {
        { '<leader><tab>', '<cmd>Neotree toggle<CR>', desc = 'NeoTree' },
        { '<C-e>', '<cmd>Neotree toggle<CR>', desc = 'NeoTree' }
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
                    added     = '+',
                    deleted   = '-',
                    modified  = '+',
                    renamed   = 'r',
                    untracked = '?',
                    ignored   = '',
                    unstaged  = '',
                    staged    = '',
                    conflict  = '',
                },
                git_status = {
                    symbols = {
                        added     = "",  -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified  = "",  -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted   = "X", -- this can only be used in the git_status source
                        renamed   = "r", -- this can only be used in the git_status source
                        untracked = "",
                        ignored   = "",
                        unstaged  = "",
                        staged    = "",
                        conflict  = "C",
                    }
                }
            },
            filesystem = {
                follow_current_file = true,
                components = {
                    harpoon_index = function(config, node, state)
                        local Marked = require("harpoon.mark")
                        local path = node:get_id()
                        local succuss, index = pcall(Marked.get_index_of, path)
                        if succuss and index and index > 0 then
                            return {
                                text = string.format(" ⇁ %d", index), -- <-- Add your favorite harpoon like arrow here
                                highlight = config.highlight or "NeoTreeDirectoryIcon",
                            }
                        else
                            return {}
                        end
                    end
                },
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
