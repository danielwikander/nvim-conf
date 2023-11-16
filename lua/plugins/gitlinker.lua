return {
  'linrongbin16/gitlinker.nvim',
  keys = {
    {
      '<leader>gh',
      function()
        require('gitlinker').link({ action = require('gitlinker.actions').clipboard })
      end,
      mode = { 'n', 'v' },
      desc = 'Copy remote git link',
    },
    {
      '<leader>gH',
      function()
        require('gitlinker').link({ action = require('gitlinker.actions').system })
      end,
      mode = { 'n', 'v' },
      desc = 'Open remote git link',
    },
  },
  config = function()
    require('gitlinker').setup({
      highlight_duration = 300,
      mapping = false,
    })
  end,
}
