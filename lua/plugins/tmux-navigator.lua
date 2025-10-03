return {
  'christoomey/vim-tmux-navigator',
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
    'TmuxNavigatePrevious',
    'TmuxNavigatorProcessList',
  },
  keys = {
    { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Got to the left pane' },
    { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Got to the down pane' },
    { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Got to the up pane' },
    { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Got to the right pane' },
    { mode = 'n', '<c-h>', '<cmd>TmuxNavigateLeft<cr>' },
    { mode = 'n', '<c-j>', '<cmd>TmuxNavigateDown<cr>' },
    { mode = 'n', '<c-k>', '<cmd>TmuxNavigateUp<cr>' },
    { mode = 'n', '<c-l>', '<cmd>TmuxNavigateRight<cr>' },
    { mode = 'n', '<c-\\>', '<cmd>TmuxNavigatePrevious<cr>' },
    { mode = 't', '<c-h>', '<C-w><cmd>TmuxNavigateLeft<cr>' },
    { mode = 't', '<c-j>', '<C-w><cmd>TmuxNavigateDown<cr>' },
    { mode = 't', '<c-k>', '<C-w><cmd>TmuxNavigateUp<cr>' },
    { mode = 't', '<c-l>', '<C-w><cmd>TmuxNavigateRight<cr>' },
    { mode = 't', '<c-\\>', '<C-w><cmd>TmuxNavigatePrevious<cr>' },
  },
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
}
