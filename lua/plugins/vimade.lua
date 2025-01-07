return {
  'tadaa/vimade',
  event = 'VeryLazy',
  setup = function()
    require('vimade').setup({
      recipe = { 'duo', { animate = false } },
      ncmode = 'windows',
      enablefocusfading = true,
    })
  end,
}
