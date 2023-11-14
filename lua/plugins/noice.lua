return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('noice').setup({
      views = {
        cmdline_popup = {
          position = {
            row = '15%',
            col = '50%',
          },
          border = {
            style = 'none',
            padding = { 1, 2 },
          },
          filter_options = {},
          win_options = {
            winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
          },
        },
        confirm = {
          border = {
            style = 'none',
            padding = { 1, 2 },
          },
          win_options = {
            winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
          },
        },
        mini = {
          reverse = false,
          win_options = {
            winhighlight = 'NormalFloat:Normal,FloatBorder:FloatBorder',
            winblend = 0,
          },
          position = { row = 0 },
          timeout = 3000,
        },
      },
      presets = {
        inc_rename = true,
      },
      messages = {
        view = 'mini',
        view_warn = 'mini',
        view_error = 'mini',
        view_history = 'messages',
        view_search = 'mini',
      },
      lsp = {
        progress = {
          enabled = false,
          view = 'mini',
        },
        hover = { enabled = false },
        signature = { enabled = false },
      },
    })
  end,
}
