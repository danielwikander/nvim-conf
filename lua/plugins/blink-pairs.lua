return {
  'saghen/blink.pairs',
  version = '*',
  dependencies = 'saghen/blink.download',
  opts = {
    mappings = {
      cmdline = false,
      disabled_filetypes = { 'snacks_picker_input' },
    },
    highlights = {
      enabled = false,
      groups = {
        'BlinkPairsOrange',
        'BlinkPairsPurple',
        'BlinkPairsBlue',
      },
    },
  },
}
