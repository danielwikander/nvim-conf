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

-- Center cursor on scroll
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })

-- Center cursor on search
map('n', 'n', 'nzzzv', { desc = 'Next result' })
map('n', 'N', 'Nzzzv', { desc = 'Previous result' })

-- Move lines around
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move lines down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move lines up' })

-- Format
map('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format file' })
map('n', '==', vim.lsp.buf.format, { desc = 'Format file' })

-- Splits
map('n', '<leader>v', ':vsplit<CR>', { desc = 'Split vertically', silent = true })
map('n', '<leader>h', ':split<CR>', { desc = 'Split horizontally', silent = true })

-- Navigate
map('n', '<C-k>', '<cmd>cnext<CR>zz')
map('n', '<C-j>', '<cmd>cprev<CR>zz')
map('n', '<leader>k', '<cmd>lnext<CR>zz')
map('n', '<leader>j', '<cmd>lprev<CR>zz')

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
map('t', '<C-h>', [[<C-\><C-N><C-w>h]],
    { desc = 'Navigate to window on the left', noremap = true, silent = true })
map('t', '<C-j>', [[<C-\><C-N><C-w>j]],
    { desc = 'Navigate to window below', noremap = true, silent = true })
map('t', '<C-k>', [[<C-\><C-N><C-w>k]],
    { desc = 'Navigate to window above', noremap = true, silent = true })

-- Window resize
map('n', '<c-left>', '<Cmd>vertical resize +5<CR>', { desc = 'Resize window: vertical++' })
map('n', '<c-right>', '<Cmd>vertical resize -5<CR>', { desc = 'Resize window: vertical--' })
map('n', '<c-down>', '<Cmd>horizontal resize -5<CR>', { desc = 'Resize window: horizontal--' })
map('n', '<c-up>', '<Cmd>horizontal resize +5<CR>', { desc = 'Resize window: horizontal++' })
map('t', '<c-left>', '<Cmd>vertical resize +5<CR>', { desc = 'Resize window: vertical++' })
map('t', '<c-right>', '<Cmd>vertical resize -5<CR>', { desc = 'Resize window: vertical--' })
map('t', '<c-down>', '<Cmd>horizontal resize -5<CR>', { desc = 'Resize window: horizontal--' })
map('t', '<c-up>', '<Cmd>horizontal resize +5<CR>', { desc = 'Resize window: horizontal++' })

-- Code actions
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition', noremap = true, silent = true })
map('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation', noremap = true, silent = true })

-- Diagnostics
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

-- Open scratch buffer
map('n', '<leader>-', ':e ~/.scratch.md<cr>', { desc = 'Open scratch buffer', noremap = true, silent = true })

