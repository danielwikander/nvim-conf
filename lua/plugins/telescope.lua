return
{
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'debugloop/telescope-undo.nvim',
    },
    cmd = 'Telescope',
    keys = {
        {
            '<leader>p',
            function()
                require('telescope.builtin').live_grep()
            end,
            desc = 'Search string'
        },
        {
            '<leader>fs',
            function()
                require('telescope.builtin').live_grep()
            end,
            desc = 'Search string'
        },
        {
            '<leader>fw',
            function()
                require('telescope.builtin').grep_string()
            end,
            desc = 'Search word'
        },
        {
            '<leader>fr',
            function()
                require('telescope.builtin').oldfiles()
            end,
            desc = 'Recent files'
        },
        {
            '<leader>ff',
            function()
                require('telescope.builtin').find_files()
            end,
            desc = 'Files'
        },
        {
            '<leader>fm',
            function()
                require('telescope.builtin').marks()
            end,
            desc = 'Marks'
        },
        {
            '<C-p>',
            function()
                require('telescope.builtin').git_files({ show_untracked = true })
            end,
            desc = 'Search git files'
        },
        {
            '<leader>fu',
            '<cmd>Telescope undo<cr>',
            desc = 'Undo tree'
        },
        {
            '<leader>0',
            '<cmd>Telescope harpoon marks<cr>',
            desc = 'Harpoon marks'
        },
        {
            '<leader>E',
            function() require('telescope.builtin').diagnostics() end,
            desc = 'Diagnostics'
        },
        {
            '<leader>fe',
            function() require('telescope.builtin').diagnostics() end,
            desc = 'Diagnostics'
        },
        {
            'gr',
            function() require('telescope.builtin').lsp_references() end,
            desc = 'References'
        },
        {
            '<leader>b',
            function() require('telescope.builtin').buffers({
                sort_mru = true,
                ignore_current_buffer=true,
            }) end,
            desc = 'Buffers'
        },
        {
            '<leader>fb',
            function() require('telescope.builtin').buffers() end,
            desc = 'Buffers'
        },
    },
    lazy = true,
    config = function()
        local actions = require('telescope.actions')
        local undo = require('telescope-undo.actions')
        require('telescope').setup({
            defaults = {
                vimgrep_arguments = {
                    'rg',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case',
                },
                prompt_prefix = ' ',
                results_title = '',
                prompt_title = '',
                selection_caret = ' ',
                path_display = { "truncate", "smart" },
                file_ignore_patterns = { 'node_modules', 'package%-lock.json' },
                layout_strategy = 'no_title',
                layout_config = {
                    horizontal = {
                        prompt_position = 'top',
                        width = function(_, cols, _)
                            if cols > 200 then
                                return 200
                            else
                                return math.floor(cols * 0.92)
                            end
                        end
                    }
                },
                sorting_strategy = 'ascending',
                mappings = {
                    i = {
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<down>'] = actions.cycle_history_next,
                        ['<up>'] = actions.cycle_history_prev,
                        ['<esc>'] = actions.close,
                    }
                }
            },
            extensions = {
                undo = {
                    side_by_side = false,
                    mappings = {
                        i = {
                            ['<cr>'] = undo.yank_additions,
                            ['<S-cr>'] = undo.yank_deletions,
                            ['<C-cr>'] = undo.restore,
                        },
                    },
                },
            },
        })

        require('telescope.pickers.layout_strategies').no_title = function(
            picker,
            max_columns,
            max_lines,
            layout_config
        )
            local layout = require('telescope.pickers.layout_strategies').horizontal(
                picker,
                max_columns,
                max_lines,
                layout_config
            )
            layout.prompt.title = ''
            layout.results.title = ''
            return layout
        end

        require('telescope').load_extension('undo')
        require('telescope').load_extension('harpoon')
    end
}

