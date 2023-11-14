return {
  'folke/zen-mode.nvim',
  keys = {
    { '<leader>z', '<cmd>ZenMode<cr>', mode = 'n', desc = 'Toggle ZenMode' },
  },
  opts = {
    window = {
      backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      options = {
        signcolumn = 'no', -- disable signcolumn
        cursorcolumn = false, -- disable cursor column
      },
    },
    plugins = {
      gitsigns = {
        enabled = false,
      },
      alacritty = {
        enabled = false,
        font = '18',
      },
    },
  },
}
