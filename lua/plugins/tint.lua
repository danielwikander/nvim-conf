return {
  'levouh/tint.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('tint').setup({
      tint = -60,
      saturation = 0.3,
      highlight_ignore_patterns = {
        'WinSeparator',
        'Status.*',
        'NeoTreeIndentMarker',
        'NeoTreeDimText',
        'NeoTreeDotFile',
        'NeoTreeFadeText1',
        'NeoTreeFadeText2',
        'NeoTreeFileStats',
        'NeoTreeMessage',
        'EndOfBuffer',
      },
    })
  end,
}
