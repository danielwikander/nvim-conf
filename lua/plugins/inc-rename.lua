return
{
    'smjonas/inc-rename.nvim',
    keys = {
        { '<leader>r', desc = 'Incremental rename' }
    },
    config = function()
        vim.keymap.set("n", "<leader>r", function()
            return ":IncRename " .. vim.fn.expand("<cword>")
        end, { expr = true })
        require('inc_rename').setup({
            hl_group = 'NormalFloat',
            preview_empty_name = true
        })
    end
}
