return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  cmd = 'Gitsigns',
  keys = {
    { '<leader>w', '<cmd>Gitsigns preview_hunk_inline<CR>', desc = 'Preview hunk inline' },
    { '<leader>W', '<cmd>Gitsigns preview_hunk<CR>', desc = 'Preview hunk' },
    { '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', desc = 'Toggle git blame inline' },
    { '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>', desc = 'Reset git hunk' },
  },
  config = function()
    require('gitsigns').setup()
  end,
}
