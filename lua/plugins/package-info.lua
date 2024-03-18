return {
  'vuki656/package-info.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  event = { 'BufReadPost package.json' },
  opts = {
    colors = {
      up_to_date = '#737c73',
      outdated = '#d19a66',
    },
    hide_up_to_date = true,
  },
}
