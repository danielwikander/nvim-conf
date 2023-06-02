return
{
    'nvim-telescope/telescope.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
    },
    lazy = false,
    config = function()
        local actions = require('telescope.actions')
        local undo = require('telescope-undo.actions')
        require('telescope').setup({
            defaults = {
                prompt_prefix = ' ',
                results_title = '',
                prompt_title = '',
                layout_strategy = 'no_title',
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                        ["<esc>"] = actions.close,
                    }
                }
            },
            extensions = {
                undo = {
                    side_by_side = false,
                    mappings = {
                        i = {
                            ["<cr>"] = undo.yank_additions,
                            ["<S-cr>"] = undo.yank_deletions,
                            ["<C-cr>"] = undo.restore,
                        },
                    },
                },
            },
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- Find file
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})       -- Find files in git
        vim.keymap.set('n', '<leader>p', builtin.live_grep, {})   -- Find string in repo

        require('telescope.pickers.layout_strategies').no_title = function(picker, max_columns, max_lines,
                                                                           layout_config)
            local layout = require('telescope.pickers.layout_strategies').horizontal(picker, max_columns, max_lines,
                layout_config)
            layout.prompt.title = ''
            layout.results.title = ''
            layout.preview.title = ''
            return layout
        end
        require('telescope').load_extension('undo')
        vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
        vim.keymap.set('n', '<leader>E', require('telescope.builtin').diagnostics, { desc = 'Open diagnostics list' })
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'References' })
    end
}
