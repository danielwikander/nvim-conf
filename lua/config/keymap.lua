-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set

-- Unbind defaults
map('', '<Space>', '<Nop>', { noremap = true, silent = true })
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
map('n', 'Q', '<nop>')
map('n', 'q', '<nop>')
map('v', 'c', '<nop>')

-- Required for C-i (forward in  jumplist) to work
map('n', '<C-i>', '<C-i>')

-- Center cursor on scroll
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })

-- Center cursor on search
map('n', 'n', 'nzzzv', { desc = 'Next result' })
map('n', 'N', 'Nzzzv', { desc = 'Previous result' })

-- Move lines around
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move lines down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move lines up' })

-- Splits
map('n', '<leader>v', ':vsplit<CR>', { desc = 'Split vertically', silent = true })
map('n', '<leader>h', ':split<CR>', { desc = 'Split horizontally', silent = true })

-- Navigate
map('n', '<C-k>', '<cmd>cnext<CR>zz')
map('n', '<C-j>', '<cmd>cprev<CR>zz')

-- Buffers
map('n', 'L', '<cmd>bn<CR>zz')
map('n', 'H', '<cmd>bp<CR>zz')

-- Make file executable
map('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make file executable' })

-- Tabs and indentation
map('n', '<Tab>', '>>_', { desc = 'Indentation++' })
map('n', '<S-Tab>', '<<_', { desc = 'Indentation--' })
map('i', '<S-Tab>', '<C-D>', { desc = 'Indentation--' })
map('v', '<Tab>', '>gv', { desc = 'Indentation++ on selected' })
map('v', '<S-Tab>', '<gv', { desc = 'Indentation-- on selected' })

-- Window navigation
map('n', '<c-h>', '<c-w>h', { desc = 'Navigate to window on the left' })
map('n', '<c-j>', '<c-w>j', { desc = 'Navigate to window on the right' })
map('n', '<c-k>', '<c-w>k', { desc = 'Navigate to window above' })
map('n', '<c-l>', '<c-w>l', { desc = 'Navigate to window below' })

-- Move between windows while in terminal mode
map('t', '<C-h>', [[<C-\><C-N><C-w>h]], { desc = 'Navigate to window on the left', noremap = true, silent = true })
map('t', '<C-j>', [[<C-\><C-N><C-w>j]], { desc = 'Navigate to window below', noremap = true, silent = true })
map('t', '<C-k>', [[<C-\><C-N><C-w>k]], { desc = 'Navigate to window above', noremap = true, silent = true })
map('t', '<esc>', [[<C-\><C-n>]],       { desc = 'Exit terminal mode', noremap = true, silent = true })

-- Window resize
map('n', '<c-left>', '<Cmd>vertical resize +5<CR>', { desc = 'Resize window: vertical++' })
map('n', '<c-right>', '<Cmd>vertical resize -5<CR>', { desc = 'Resize window: vertical--' })
map('n', '<c-down>', '<Cmd>horizontal resize -5<CR>', { desc = 'Resize window: horizontal--' })
map('n', '<c-up>', '<Cmd>horizontal resize +5<CR>', { desc = 'Resize window: horizontal++' })
map('t', '<c-left>', '<Cmd>vertical resize +5<CR>', { desc = 'Resize window: vertical++' })
map('t', '<c-right>', '<Cmd>vertical resize -5<CR>', { desc = 'Resize window: vertical--' })
map('t', '<c-down>', '<Cmd>horizontal resize -5<CR>', { desc = 'Resize window: horizontal--' })
map('t', '<c-up>', '<Cmd>horizontal resize +5<CR>', { desc = 'Resize window: horizontal++' })

-- Open scratch buffer
map('n', '<leader>-', ':e ~/.scratch.md<cr>', { desc = 'Scratch buffer', noremap = true, silent = true })

-- Remove highlights after search
map('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights', noremap = true, silent = true })
