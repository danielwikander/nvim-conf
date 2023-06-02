-- Fetch lazy package manager if not already installed.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup("plugins", {
    install = { colorscheme = { "kanagawa-dragon" } },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin"
            }
        }
    }
})

local opt = vim.opt
opt.autowrite = true           -- Enable auto write
opt.clipboard = "unnamedplus"  -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3           -- Hide * markup for bold and italic
opt.confirm = true             -- Confirm to save changes before exiting modified buffer
opt.colorcolumn = '80'         -- Colored column
opt.cursorline = true          -- Enable highlighting of the current line
opt.expandtab = true           -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true      -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 0
opt.list = true            -- Show some invisible characters (tabs...
opt.mouse = "a"            -- Enable mouse mode
opt.number = true          -- Print line number
opt.pumblend = 10          -- Popup blend
opt.pumheight = 10         -- Maximum number of entries in a popup
opt.relativenumber = false -- Relative line numbers
opt.scrolloff = 10         -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true      -- Round indent
opt.shiftwidth = 4         -- Size of an indent
opt.shortmess:append { W = true, I = true, c = true }
opt.showmode = false       -- Dont show mode since we have a statusline
opt.sidescrolloff = 8      -- Columns of context
opt.signcolumn = "yes"     -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true       -- Don't ignore case with capitals
opt.smartindent = true     -- Insert indents automatically
opt.softtabstop = 4
opt.spelllang = { "en" }
opt.splitbelow = true    -- Put new windows below current
opt.splitright = true    -- Put new windows right of current
opt.tabstop = 4          -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200               -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.wrap = false                   -- Disable line wrap
opt.hlsearch = true
opt.incsearch = true

vim.o.cmdheight = 0

if vim.fn.has("nvim-0.9.0") == 1 then
    opt.splitkeep = "screen"
    opt.shortmess:append { C = true }
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0


-- Keymaps

-- Move lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J stays in place
vim.keymap.set("n", "J", "mzJ`z")

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

-- Format (try == ?)
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
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
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

vim.diagnostic.config({
    float = {
        border = "none"
    },
})

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
-- vim.keymap.set('n', 'J', require('treesj').toggle)

-- Highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=150})
augroup END
]]
