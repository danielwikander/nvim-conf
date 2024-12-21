return {
  'tadaa/vimade',
  -- event = 'VeryLazy',
  setup = function()
    require('vimade').setup({
      recipe = { 'duo', { animate = false } },
      ncmode = 'windows',
      tint = { bg = { rgb = { 0, 0, 0 }, intensity = 0.3 } },
      enablefocusfading = true,
    })
  end,
}
