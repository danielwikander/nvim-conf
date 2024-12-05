return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy', -- Or `VeryLazy`
  priority = 1000, -- needs to be loaded in first
  config = function()
    require('tiny-inline-diagnostic').setup({
      preset = 'classic',
      hi = {
        -- background = '181616',
        background = nil,
      },
      options = {
        multilines = true,
        -- use_icons_from_diagnostic = true,
      },
    })
  end,
}
