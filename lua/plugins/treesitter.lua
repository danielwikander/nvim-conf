return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring',
        {
            'windwp/nvim-ts-autotag',
            config = function()
                require('nvim-ts-autotag').setup {}
            end
        }
    },
    config = function()
        local treesitter = require('nvim-treesitter.configs')
        require('ts_context_commentstring').setup {}
        treesitter.setup {
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
            ensure_installed = {
                'c',
                'cpp',
                'go',
                'lua',
                'python',
                'rust',
                'javascript',
                'typescript',
                'vimdoc',
                'cmake',
                'vim',
            },
            highlight = {
                enable = true
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = 'ö',
                    node_incremental = 'ö',
                    node_decremental = 'Ö',
                },
            }
        }
    end
}
