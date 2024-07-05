return {
  'folke/trouble.nvim',
  cmd = {
    'TroubleToggle',
    'Trouble',
    'TroubleClose',
    'TroubleRefresh',
  },
  dependencies = { 'echasnovski/mini.icons' },
  config = function()
    require('trouble').setup({})
  end,
}
