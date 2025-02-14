return {
  'tadaa/vimade',
  -- event = { 'BufReadPost', 'BufNewFile' },
  enabled = false,
  -- priority = 10,
  setup = function()
    require('vimade').setup({
      recipe = { 'minimalist', { animate = false } },
      ncmode = 'buffers',
      enablefocusfading = true,
    })
  end,
}
