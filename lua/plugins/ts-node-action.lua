return {
  'ckolkey/ts-node-action',
  event = { 'BufReadPost', 'BufNewFile' },
  keys = {
    {
      'J',
      function()
        require('ts-node-action').node_action()
      end,
      desc = 'Node action',
    },
  },
  dependencies = { 'nvim-treesitter' },
  opts = {},
}
