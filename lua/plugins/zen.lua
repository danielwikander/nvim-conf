return {
  'folke/zen-mode.nvim',
  enabled = false,
  dependencies = {
    'folke/twilight.nvim',
  },
  keys = {
    { '<leader>z', '<cmd>ZenMode<cr>', mode = 'n', desc = 'Toggle ZenMode' },
  },
  opts = {
    window = {
      backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      options = {
        signcolumn = 'no',
        cursorcolumn = false,
      },
    },
    plugins = {
      gitsigns = {
        enabled = false,
      },
      twilight = {
        enabled = true,
      },
    },
  },
}
