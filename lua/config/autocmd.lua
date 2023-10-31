vim.api.nvim_create_augroup('bufcheck', {clear = true})

-- Disable new line comment
vim.api.nvim_create_autocmd("BufEnter", {
    group = 'bufcheck',
    callback = function()
        vim.opt.formatoptions:remove { "c", "r", "o" }
    end,
    desc = "Disable New Line Comment",
})

-- Highlight yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = 'bufcheck',
    pattern  = '*',
    callback = function()
        vim.highlight.on_yank{higroup='Visual',timeout=150}
    end,
    desc = "Highlight yank"
})

