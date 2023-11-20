return {
  'echasnovski/mini.cursorword',
  version = false,
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('mini.cursorword').setup({ delay = 50 })
  end,
}
