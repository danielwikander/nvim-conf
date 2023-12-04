return {
  'Wansmer/treesj',
  keys = {
    { 'J', '<Cmd>TSJToggle<CR>', desc = 'Join toggle' },
    { '<leader>j', '<Cmd>TSJToggle<CR>', desc = 'Join toggle' },
  },
  lazy = true,
  cmd = { 'TSJToggle', 'TSJSplit', 'TSJJoin' },
  config = function()
    require('treesj').setup({
      opts = { use_default_keymaps = false },
    })
  end,
}
