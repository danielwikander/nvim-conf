return {
  'levouh/tint.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  enabled = false,
  priority = 10,
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
        'IblIndent',
        'IblScope',
        'IndentBlanklineChar',
        'IndentBlanklineSpaceChar',
        'IndentBlanklineSpaceCharBlankline',
        'NeotestIndent',
        'NeotestExpandMarker',
        '@ibl.scope.char.1',
        '@ibl.indent.char.1*',
        '@ibl.whitespace.char.1*',
      },
    })
  end,
}
