return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  keys = {
    {
      '<leader>ot',
      '<cmd>ObsidianToday<cr>',
      desc = 'Todays note',
    },
    {
      '<leader>oy',
      '<cmd>ObsidianYesterday<cr>',
      desc = 'Yesterdays note',
    },
    {
      '<leader>of',
      '<cmd>ObsidianFollowLink<cr>',
      desc = 'Follow link',
    },
    {
      '<leader>os',
      '<cmd>ObsidianSearch<cr>',
      desc = 'Search',
    },
    {
      '<leader>oo',
      '<cmd>ObsidianOpen<cr>',
      desc = 'Open',
    },
    {
      '<leader>ob',
      '<cmd>ObsidianBacklinks<cr>',
      desc = 'Backlinks',
    },
    {
      '<leader>on',
      '<cmd>ObsidianNew<cr>',
      desc = 'New',
    },
    {
      '<leader>om',
      '<cmd>ObsidianLink<cr>',
      desc = 'Link',
      mode = 'v',
    },
    {
      '<leader>ol',
      '<cmd>ObsidianLinkNew<cr>',
      desc = 'New link',
      mode = 'v',
    },
  },
  event = {
    'BufReadPre ' .. vim.fn.expand('~') .. '/vaults/**.md',
    'BufNewFile ' .. vim.fn.expand('~') .. '/vaults/**.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('obsidian').setup({
      workspaces = {
        {
          name = 'personal',
          path = '~/vaults/personal',
        },
        {
          name = 'work',
          path = '~/vaults/work',
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = 'notes/dailies',
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = '%B %-d, %Y',
      },
    })
  end,
}
