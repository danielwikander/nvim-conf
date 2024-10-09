return {
  keys = {
    { 'u', desc = 'Undo' },
    { '<C-r>', desc = 'Redo' },
    { 'p', desc = 'Paste' },
    { 'P', desc = 'Paste above' },
  },
  'tzachar/highlight-undo.nvim',
  config = function()
    require('highlight-undo').setup({
      -- keymaps = {
      -- paste = {
      --   disabled = true,
      -- },
      -- Paste = {
      --   disabled = true,
      -- },
      -- },
    })
  end,
}
