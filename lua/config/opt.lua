local opt = vim.opt
opt.autowrite = true           -- Enable auto write
opt.clipboard = 'unnamedplus'  -- Sync with system clipboard
opt.colorcolumn = '80'         -- Colored column
opt.completeopt = 'menu,menuone,noselect'
opt.conceallevel = 3           -- Hide * markup for bold and italic
opt.confirm = true             -- Confirm to save changes before exiting modified buffer
opt.cursorline = true          -- Enable highlighting of the current line
opt.expandtab = true           -- Use spaces instead of tabs
opt.formatoptions = 'jcroqlnt' -- tcqj
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'
opt.hlsearch = true
opt.ignorecase = true      -- Ignore case
opt.inccommand = 'nosplit' -- preview incremental substitute
opt.incsearch = true
opt.laststatus = 0
opt.list = true            -- Show some invisible characters (tabs...
opt.mouse = 'a'            -- Enable mouse mode
opt.number = true          -- Print line number
opt.pumblend = 10          -- Popup blend
opt.pumheight = 10         -- Maximum number of entries in a popup
opt.relativenumber = false -- Relative line numbers
opt.scrolloff = 10         -- Lines of context
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize' }
opt.shiftround = true      -- Round indent
opt.shiftwidth = 4         -- Size of an indent
opt.shortmess:append { C = true }
opt.shortmess:append { W = true, I = true, c = true }
opt.showmode = false     -- Dont show mode since we have a statusline
opt.sidescrolloff = 8    -- Columns of context
opt.signcolumn = 'yes:1' -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true     -- Don't ignore case with capitals
opt.smartindent = true   -- Insert indents automatically
opt.softtabstop = 4
opt.spelllang = { 'en' }
opt.splitbelow = true    -- Put new windows below current
opt.splitkeep = 'screen'
opt.splitright = true    -- Put new windows right of current
opt.tabstop = 4          -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200               -- Save swap file and trigger CursorHold
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.wrap = false                   -- Disable line wrap

vim.o.cmdheight = 0
vim.o.statuscolumn = '%s%l'

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Diagnostics styling
vim.diagnostic.config({
    float = {
        border = 'none'
    }
})

vim.fn.sign_define("DiagnosticSignError",
    { text = "▲", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
    { text = "▲", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
    { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
    { text = "⚑", texthl = "DiagnosticSignHint" })

-- Highlight yanked text for 200ms using the 'Visual' highlight group
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup='Visual', timeout=150})
augroup END
]]
