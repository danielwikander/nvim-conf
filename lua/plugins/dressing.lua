return
{
    'stevearc/dressing.nvim',
    keys = {
        { '<leader><CR>', vim.lsp.buf.code_action, desc = 'See code actions', noremap = true, silent = true },
    },
    dependencies = {
        'MunifTanjim/nui.nvim'
    },
    config = function()
        require('dressing').setup({
            input = {
                enabled = false,
            },
            select = {
                enabled = true,
                backend = {
                    'nui',
                    'telescope',
                    'fzf_lua',
                    'fzf',
                    'builtin',
                },
                nui = {
                    position = { row = 2, col = 0 },
                    relative = 'cursor',
                    min_height = 1,
                    border = {
                        style = 'single',
                        padding = { 0, 1 }
                    },
                    max_height = 200,
                }
            }
        })
    end
}

