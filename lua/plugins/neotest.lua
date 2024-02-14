return {
    'nvim-neotest/neotest',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-treesitter/nvim-treesitter',
        'nvim-neotest/neotest-jest',
    },
    keys = {
        {
            '<leader>tw',
            function ()
                require('neotest').run.run({ jestCommand = 'jest --watch ' })
            end,
            desc = 'Toggle test watch'
        },
        {
            '<leader>tc',
            function ()
                require('neotest').run.run()
            end,
            desc = 'Test closest'
        },
        {
            '<leader>tf',
            function ()
                require('neotest').run.run(vim.fn.expand('%'))
            end,
            desc = 'Test file'
        },
    },
    config = function()
        require('neotest').setup({
            adapters = {
                ["neotest-jest"] = {
                    jestCommand = 'yarn test',
                    jestConfigFile = 'jest.config.ts',
                    env = { CI = true },
                    cwd = function(_)
                        return vim.fn.getcwd()
                    end,
                },
            },
            status = { virtual_text = true },
            output = { open_on_run = true },
        })
    end
}
