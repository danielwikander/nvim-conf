return {
  'ckolkey/ts-node-action',
  event = { 'BufReadPost', 'BufNewFile' },
  keys = {
    {
      '<leader>j',
      function()
        require('ts-node-action').node_action()
      end,
      desc = 'Node action',
    },
  },
  dependencies = { 'nvim-treesitter' },
  opts = {},
}
