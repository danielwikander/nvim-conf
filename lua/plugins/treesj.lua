return
{
    'Wansmer/treesj',
    keys = {
        { 'J', '<Cmd>TSJToggle<CR>', desc = 'Join toggle' },
        { '<leader>j', '<Cmd>TSJToggle<CR>', desc = 'Join toggle' }
    },
    lazy = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    cmd = { 'TSJToggle', 'TSJSplit', 'TSJJoin' },
    opts = { use_default_keymaps = false },
    config = function()
        require('treesj').setup {
            opts = { use_default_keymaps = false }
        }
    end,
}
