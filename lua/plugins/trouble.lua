return {
  'folke/trouble.nvim',
  cmd = {
    'TroubleToggle',
    'Trouble',
    'TroubleClose',
    'TroubleRefresh',
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('trouble').setup({})
  end,
}
