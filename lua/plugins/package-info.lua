return {
  'vuki656/package-info.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  event = { 'BufReadPost package.json' },
  opts = { hide_up_to_date = true },
}
