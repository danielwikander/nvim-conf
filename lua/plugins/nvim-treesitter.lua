return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
        'windwp/nvim-ts-autotag'
    },
    config = function()
        local treesitter = require('nvim-treesitter.configs')
        treesitter.setup {
            ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'vimdoc', 'cmake', 'vim' },
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
            },
        }
    end
}
