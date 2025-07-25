return {
  'folke/noice.nvim',
  event = 'UIEnter',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  keys = {
    {
      'K',
      function()
        require('noice.lsp').hover()
      end,
      desc = 'Hover documentation',
    },
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
      notify = {
        enabled = false,
      },
      lsp = {
        progress = {
          enabled = false,
          view = 'mini',
        },
        hover = { enabled = true, silent = true },
        signature = { enabled = false },
        override = {
          -- override the default lsp markdown formatter with Noice
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          -- override the lsp markdown formatter with Noice
          ['vim.lsp.util.stylize_markdown'] = true,
          -- override cmp documentation with Noice (needs the other options to work)
          ['cmp.entry.get_documentation'] = true,
        },
      },
    })
  end,
}
