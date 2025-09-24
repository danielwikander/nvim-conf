return {
  'folke/trouble.nvim',
  cmd = {
    'TroubleToggle',
    'Trouble',
    'TroubleClose',
    'TroubleRefresh',
  },
  dependencies = { 'nvim-mini/mini.icons' },
  config = function()
    require('trouble').setup({})
  end,
}
