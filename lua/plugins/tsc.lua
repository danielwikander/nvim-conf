return {
  'dmmulroy/tsc.nvim',
  event = { 'BufReadPost *.ts,*.tsx,*.js,*.jsx', 'BufNewFile *.ts,*.tsx,*.js,*.jsx' },
  config = function()
    require('tsc').setup()
  end,
}
