return {
    'Wansmer/treesj',
    lazy = false,
    keys = {
        { 'J', '<cmd>TSJToggle<cr>', desc = "Join toggle", mode = "n" },
        -- {
        --     'J',
        --     function()
        --         require('treesj').toggle()
        --     end,
        --     desc = "Join toggle",
        --     mode = "n",
        --     remap = true
        -- }
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    -- lazy = false,
    cmd = { 'TSJToggle', 'TSJSplit', 'TSJJoin' },
    opts = { use_default_keymaps = false },
    config = function()
        require('treesj').setup {
            -- opts = { use_default_keymaps = false }
            vim.keymap.set('n', 'J', require('treesj').toggle)
        }
    end,
}
