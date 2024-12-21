vim.g.snacks_animate = false

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
    {
      '<leader>z',
      function()
        Snacks.zen()
      end,
      desc = 'Toggle Zen Mode',
    },
    {
      '<leader>Z',
      function()
        Snacks.zen.zoom()
      end,
      desc = 'Toggle Zoom',
    },
  },
  opts = {
    bigfile = { enabled = true },
    notifier = { enabled = false },
    quickfile = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    indent = {
      char = '▎',
      enabled = true,
      only_current = true,
      scope = {
        enabled = true,
        animate = { enabled = false },
        char = '▎',
        only_current = false,
      },
      blank = {
        char = '·',
      },
    },
    zen = { enabled = true, win = { backdrop = false, width = 0 } },
    lazygit = {
      win = {
        height = 0,
        width = 0,
      },
    },
    dashboard = {
      enabled = true,
      preset = {
        keys = {

          { icon = ' ', key = 'f', desc = 'Find File', action = '<cmd>FzfLua files<cr>' },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'p', desc = 'Find Text', action = '<cmd>FzfLua live_grep<cr>' },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = '<cmd>FzfLua oldfiles<cr>' },
          {
            icon = ' ',
            key = 'c',
            desc = 'Config',
            action = ':e $MYVIMRC | cd%:h',
          },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
      sections = {
        -- { section = 'header' },
        { icon = ' ', title = '', section = 'keys', indent = 0, padding = 4 },
        { icon = ' ', title = '', section = 'recent_files', indent = 0, padding = 6 },
        { section = 'startup', indent = 0 },
      },
    },
  },
}
