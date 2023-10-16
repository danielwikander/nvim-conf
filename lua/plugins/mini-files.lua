return
{
    'echasnovski/mini.files',
    version = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        { '<leader><tab>', '<cmd>lua MiniFiles.open()<CR>', desc = 'Open filetree' },
        { '<C-e>',         '<cmd>lua MiniFiles.open()<CR>', desc = 'Open filetree' }
    },
    config = function()
        local show_dotfiles = true

        local filter_show = function(_)
            return true
        end
        local filter_hide = function(fs_entry)
            return not vim.startswith(fs_entry.name, '.')
        end

        local toggle_dotfiles = function()
            show_dotfiles = not show_dotfiles
            local new_filter = show_dotfiles and filter_show or filter_hide
            MiniFiles.refresh({
                content = {
                    filter = new_filter
                }
            })
        end

        vim.api.nvim_create_autocmd('User', {
            pattern = 'MiniFilesBufferCreate',
            callback = function(args)
                local buf_id = args.data.buf_id
                vim.keymap.set('n', 'H', toggle_dotfiles, { buffer = buf_id })
                -- vim.keymap.set('n', '<CR>', '<cmd>lua MiniFiles.go_in()<CR><cmd>lua MiniFiles.close()<CR>',
                --     { buffer = buf_id })
                vim.keymap.set('n', '<leader><tab>', '<cmd>lua MiniFiles.close()<CR>', { buffer = buf_id })
                vim.keymap.set('n', '<C-e>', '<cmd>lua MiniFiles.close()<CR>', { buffer = buf_id })
            end
        })
        require('mini.files').setup({
            mappings = {
                go_in = 'L',
                go_in_plus = 'l',
            },
            windows = {
                max_number = 3,
                -- preview = true,
                width_focus = 50,
                width_nofocus = 20,
            },
        })
    end
}
