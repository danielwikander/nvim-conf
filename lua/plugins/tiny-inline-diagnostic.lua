return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy', -- Or `VeryLazy`
  priority = 999, -- needs to be loaded in first
  config = function()
    require('tiny-inline-diagnostic').setup({
      background = 'TinyDiag',
      options = {
        multilines = true,
      },
      signs = {
        left = '░',
        right = '░',
      },
      blend = { factor = 0.15 },
    })
  end,
}
