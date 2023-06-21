-- Leader
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Move lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center cursor on scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center cursor on search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Unbind defaults
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("v", "c", "<nop>")

-- Format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Splits
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
vim.keymap.set("n", "<leader>h", ":split<CR>")

-- Navigate
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace word
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Tabs and indentation
vim.keymap.set("n", "<Tab>", ">>_");
vim.keymap.set("n", "<S-Tab>", "<<_");
vim.keymap.set("i", "<S-Tab>", "<C-D>");
vim.keymap.set("v", "<Tab>", ">gv");
vim.keymap.set("v", "<S-Tab>", "<gv");

-- Window navigation
vim.keymap.set("n", "<c-h>", "<c-w>h");
vim.keymap.set("n", "<c-j>", "<c-w>j");
vim.keymap.set("n", "<c-k>", "<c-w>k");
vim.keymap.set("n", "<c-l>", "<c-w>l");

-- Window resize
vim.keymap.set("n", "<c-left>", "<Cmd>vertical resize +5<CR>");
vim.keymap.set("n", "<c-right>", "<Cmd>vertical resize -5<CR>");
vim.keymap.set("n", "<c-down>", "<Cmd>horizontal resize -5<CR>");
vim.keymap.set("n", "<c-up>", "<Cmd>horizontal resize +5<CR>");
vim.keymap.set("t", "<c-left>", "<Cmd>vertical resize +5<CR>");
vim.keymap.set("t", "<c-right>", "<Cmd>vertical resize -5<CR>");
vim.keymap.set("t", "<c-down>", "<Cmd>horizontal resize -5<CR>");
vim.keymap.set("t", "<c-up>", "<Cmd>horizontal resize +5<CR>");

-- Buffer navigation (tabs)
vim.keymap.set("n", "<S-h>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })

-- Barbar
vim.keymap.set("n", "<leader>q", "<cmd>BufferClose<CR>")
vim.keymap.set("n", "<leader>Q", "<cmd>BufferCloseAllButVisible<CR>")

-- Move between windows while in terminal mode
vim.keymap.set('t', '<C-h>', [[<C-\><C-N><C-w>h]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', [[<C-\><C-N><C-w>j]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', [[<C-\><C-N><C-w>k]], { noremap = true, silent = true })

-- Code actions
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set("n", "<leader><CR>", vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = true })

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Reset space key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- treeSJ
vim.keymap.set('n', 'J', '<CMD>TSJToggle<CR>', { desc = 'TSJ Toggle' })
vim.keymap.set('n', '<leader>j', '<CMD>TSJToggle<CR>', { desc = 'TSJ Toggle' })
