local autocmd = vim.api.nvim_create_autocmd
local autogrp = vim.api.nvim_create_augroup
local usercmd = vim.api.nvim_create_user_command

autogrp('bufcheck', { clear = true })

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
usercmd('FormatDisable', function(args)
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
usercmd('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

-- Disable diagnostics in node_modules (0 is current buffer only)
local disable_node_modules_eslint_group = autogrp('DisableNodeModulesEslint', { clear = true })
autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '**/node_modules/**', 'node_modules', '/node_modules/*' },
  callback = function()
    vim.diagnostic.enable(false, { bufnr = 0 })
  end,
  group = disable_node_modules_eslint_group,
})

-- Enable spellcheck
autocmd('FileType', {
  pattern = { 'gitcommit', 'text' },
  callback = function()
    vim.opt_local.spell = true
  end,
})
