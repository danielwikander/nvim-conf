return {
  'rachartier/tiny-devicons-auto-colors.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VeryLazy',
  config = function()
    local palette = require('kanagawa.colors').setup().palette
    require('tiny-devicons-auto-colors').setup({
      colors = palette,
    })
  end,
}
