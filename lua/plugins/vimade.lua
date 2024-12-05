return {
  'tadaa/vimade',
  enable = false,
  event = 'VeryLazy',
  setup = function()
    local Minimalist = require('vimade.recipe.minimalist').Minimalist
    require('vimade').setup(Minimalist({ ncmode = 'windows' }))
  end,
  -- opts = {},
}
