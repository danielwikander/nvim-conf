return {
  'chrishrb/gx.nvim',
  keys = {
    {
      'gx',
      '<cmd>Browse<cr>',
      mode = { 'n', 'x' },
      desc = 'Open link in browser',
    },
  },
  init = function ()
    vim.g.netrw_nogx = 1 -- disable netrw gx
  end,
  submodules = false, -- not needed, submodules are required only for tests
  cmd = { 'Browse' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = true, -- default settings
}
