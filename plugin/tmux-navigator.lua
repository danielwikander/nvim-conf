vim.g.tmux_navigator_no_mappings = 1

vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<cr>', { desc = 'Go to the left pane' })
vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<cr>', { desc = 'Go to the down pane' })
vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<cr>', { desc = 'Go to the up pane' })
vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<cr>', { desc = 'Go to the right pane' })
vim.keymap.set('n', '<c-\\>', '<cmd>TmuxNavigatePrevious<cr>')
vim.keymap.set('t', '<c-h>', '<C-w><cmd>TmuxNavigateLeft<cr>')
vim.keymap.set('t', '<c-j>', '<C-w><cmd>TmuxNavigateDown<cr>')
vim.keymap.set('t', '<c-k>', '<C-w><cmd>TmuxNavigateUp<cr>')
vim.keymap.set('t', '<c-l>', '<C-w><cmd>TmuxNavigateRight<cr>')
vim.keymap.set('t', '<c-\\>', '<C-w><cmd>TmuxNavigatePrevious<cr>')
