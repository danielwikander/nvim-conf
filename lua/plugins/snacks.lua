return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>gb',
      function()
        Snacks.git.blame_line()
      end,
      desc = 'Git blame line',
    },
    {
      '<leader>gf',
      function()
        Snacks.lazygit.log_file()
      end,
      desc = 'Lazygit current file history',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = 'Lazygit log (cwd)',
    },
  },
  opts = {
    bigfile = { enabled = true },
    notifier = { enabled = false },
    quickfile = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    lazygit = {
      win = {
        height = 0,
        width = 0,
      },
    },
  },
}
