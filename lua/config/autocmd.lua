local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_create_augroup('bufcheck', { clear = true })

-- Disable new line comment
autocmd('BufEnter', {
  group = 'bufcheck',
  callback = function()
    vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
  end,
  desc = 'Disable New Line Comment',
})

-- Highlight yank
autocmd('TextYankPost', {
  group = 'bufcheck',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'YankHighlight', timeout = 200 })
  end,
  desc = 'Highlight yank',
})

-- Disable autoformat
vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

-- Enable autoformat
vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

-- Disable diagnostics in node_modules (0 is current buffer only)
autocmd('BufRead', { pattern = '*/node_modules/*', command = 'lua vim.diagnostic.disable(0)' })
autocmd('BufNewFile', { pattern = '*/node_modules/*', command = 'lua vim.diagnostic.disable(0)' })

-- Enable spellcheck
autocmd('FileType', {
  pattern = { 'gitcommit', 'text' },
  callback = function()
    vim.opt_local.spell = true
  end,
})
