-- Unbind defaults
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("v", "c", "<nop>")

-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Center cursor on scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Scroll down' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Scroll up' })

-- Center cursor on search
vim.keymap.set("n", "n", "nzzzv", { desc = 'Next result' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Previous result' })

-- Move lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move lines down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move lines up' })

-- Format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = 'Format file' })

-- Splits
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = 'Split vertically' })
vim.keymap.set("n", "<leader>h", ":split<CR>", { desc = 'Split horizontally' })

-- Navigate
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'Make file executable' })

-- Tabs and indentation
vim.keymap.set("n", "<Tab>", ">>_", { desc = 'Indentation++' })
vim.keymap.set("n", "<S-Tab>", "<<_", { desc = 'Indentation--' })
vim.keymap.set("i", "<S-Tab>", "<C-D>", { desc = 'Indentation--' })
vim.keymap.set("v", "<Tab>", ">gv", { desc = 'Indentation++ on selected' })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = 'Indentation-- on selected' })

-- Window navigation
vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = 'Navigate to window on the left' })
vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = 'Navigate to window on the right' })
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = 'Navigate to window above' })
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = 'Navigate to window below' })

-- Move between windows while in terminal mode
vim.keymap.set('t', '<C-h>', [[<C-\><C-N><C-w>h]],
    { desc = 'Navigate to window on the left', noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', [[<C-\><C-N><C-w>j]],
    { desc = 'Navigate to window below', noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', [[<C-\><C-N><C-w>k]],
    { desc = 'Navigate to window above', noremap = true, silent = true })

-- Window resize
vim.keymap.set("n", "<c-left>", "<Cmd>vertical resize +5<CR>", { desc = 'Resize window: vertical++' })
vim.keymap.set("n", "<c-right>", "<Cmd>vertical resize -5<CR>", { desc = 'Resize window: vertical--' })
vim.keymap.set("n", "<c-down>", "<Cmd>horizontal resize -5<CR>", { desc = 'Resize window: horizontal--' })
vim.keymap.set("n", "<c-up>", "<Cmd>horizontal resize +5<CR>", { desc = 'Resize window: horizontal++' })
vim.keymap.set("t", "<c-left>", "<Cmd>vertical resize +5<CR>", { desc = 'Resize window: vertical++' })
vim.keymap.set("t", "<c-right>", "<Cmd>vertical resize -5<CR>", { desc = 'Resize window: vertical--' })
vim.keymap.set("t", "<c-down>", "<Cmd>horizontal resize -5<CR>", { desc = 'Resize window: horizontal--' })
vim.keymap.set("t", "<c-up>", "<Cmd>horizontal resize +5<CR>", { desc = 'Resize window: horizontal++' })

-- Buffer navigation (tabs)
vim.keymap.set("n", "<S-h>", "<Cmd>BufferPrevious<CR>",
    { desc = 'Navigate to previous buffer', noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", "<Cmd>BufferNext<CR>",
    { desc = 'Navigate to next buffer', noremap = true, silent = true })


-- Code actions
vim.keymap.set("n", "<leader><CR>", vim.lsp.buf.code_action, { desc = 'See code actions', noremap = true, silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = 'Go to definition', noremap = true, silent = true })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = 'Go to implementation', noremap = true, silent = true })

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
