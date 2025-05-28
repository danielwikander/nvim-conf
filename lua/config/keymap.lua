-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set
local unmap = vim.keymap.del

local swedish_keybinds = true

local function set_programming_binds()
  map('i', 'ö', '(')
  map('i', 'ä', ')')
  map('i', 'Ö', '{')
  map('i', 'Ä', '}')
  map('i', '<C-ö>', '[')
  map('i', '<C-ä>', ']')
end

local function set_swedish_binds()
  unmap('i', 'ö')
  unmap('i', 'ä')
  unmap('i', 'Ö')
  unmap('i', 'Ä')
  unmap('i', '<C-ö>')
  unmap('i', '<C-ä>')
end

local function toggle_swedish()
  if swedish_keybinds then
    set_programming_binds()
    swedish_keybinds = false
  else
    set_swedish_binds()
    swedish_keybinds = true
  end
end

local function go_to_definition_split()
  vim.lsp.buf.definition({
    on_list = function(options)
      if #options.items > 1 then
        vim.notify('Multiple items found, opening first one', vim.log.levels.WARN)
      end

      -- Open the first item in a vertical split
      local item = options.items[1]
      local cmd = 'vsplit +' .. item.lnum .. ' ' .. item.filename .. '|' .. 'normal ' .. item.col .. '|'

      vim.cmd(cmd)
    end,
  })
end

-- Toggle swedish / programming binds
map('n', 'Å', toggle_swedish)

-- Unbind defaults
map('', '<Space>', '<Nop>', { noremap = true, silent = true })
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
map('n', 'Q', '<nop>')
map('n', 'q', '<nop>')
map('v', 'c', '<nop>')

-- Required for C-i (forward in  jumplist) to work
map('n', '<C-i>', '<C-i>', { noremap = true, silent = true })
map('n', '§', '<C-i>')

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
map('t', '<C-l>', [[<C-\><C-N><C-w>k]], { desc = 'Navigate to window on the right', noremap = true, silent = true })
map('t', '<esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode', noremap = true, silent = true })

-- Window resize
map('n', '<c-left>', '<cmd>vertical resize +5<CR>', { desc = 'Resize window: vertical++' })
map('n', '<c-right>', '<cmd>vertical resize -5<CR>', { desc = 'Resize window: vertical--' })
map('n', '<c-down>', '<cmd>horizontal resize -5<CR>', { desc = 'Resize window: horizontal--' })
map('n', '<c-up>', '<cmd>horizontal resize +5<CR>', { desc = 'Resize window: horizontal++' })
map('t', '<c-left>', '<cmd>vertical resize +5<CR>', { desc = 'Resize window: vertical++' })
map('t', '<c-right>', '<cmd>vertical resize -5<CR>', { desc = 'Resize window: vertical--' })
map('t', '<c-down>', '<cmd>horizontal resize -5<CR>', { desc = 'Resize window: horizontal--' })
map('t', '<c-up>', '<cmd>horizontal resize +5<CR>', { desc = 'Resize window: horizontal++' })

-- Open scratch buffer
map('n', '<leader>-', ':e ~/.scratch.md<cr>', { desc = 'Scratch buffer', noremap = true, silent = true })
map('n', '<leader>_', ':vsplit ~/.scratch.md<cr>', { desc = 'Scratch buffer (vsplit)', noremap = true, silent = true })

-- Remove highlights after search
map('n', '<leader>uh', '<cmd>nohl<CR>', { desc = 'Clear search highlights', noremap = true, silent = true })
map('n', '<esc>', '<cmd>nohl<CR>', { desc = 'Clear search highlights', noremap = true, silent = true })

-- LSP
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Definition' })
map('n', 'gD', go_to_definition_split, { desc = 'Definition (vsplit)' })
map('n', 'gR', vim.lsp.buf.references, { desc = 'References' })
map('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'Type definition' })
map('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Line diagnostics' })
map('n', '<leader>ul', ':LspRestart<CR>', { desc = 'Restart LSP' })
-- map('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
map('n', '<leader><CR>', vim.lsp.buf.code_action, { desc = 'Code Action' })

-- Lazy
map('n', '<leader>L', '<cmd>Lazy<CR>', { desc = 'Lazy' })
