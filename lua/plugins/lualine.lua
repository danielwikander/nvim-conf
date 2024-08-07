return {
  'nvim-lualine/lualine.nvim',
  event = 'UIEnter',
  dependencies = {
    'echasnovski/mini.icons',
    'rebelot/kanagawa.nvim',
  },
  config = function()
    local theme = require('kanagawa.colors').setup().theme
    local kanagawa = {}
    kanagawa.normal = {
      a = { bg = theme.syn.fun, fg = theme.ui.bg, gui = 'bold' },
      b = { bg = theme.ui.bg_p1, fg = theme.syn.fun },
      c = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
      x = { bg = theme.ui.bg_p1, fg = theme.syn.comment },
      y = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
    }
    kanagawa.insert = {
      a = { bg = theme.diag.ok, fg = theme.ui.bg, gui = 'bold' },
      b = { bg = theme.ui.bg_p1, fg = theme.diag.ok },
      x = { bg = theme.ui.bg_p1, fg = theme.syn.comment },
      y = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
    }
    kanagawa.command = {
      a = { bg = theme.syn.operator, fg = theme.ui.bg, gui = 'bold' },
      b = { bg = theme.ui.bg_p1, fg = theme.syn.operator },
      x = { bg = theme.ui.bg_p1, fg = theme.syn.comment },
      y = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
    }
    kanagawa.visual = {
      a = { bg = theme.syn.keyword, fg = theme.ui.bg, gui = 'bold' },
      b = { bg = theme.ui.bg_p1, fg = theme.syn.keyword },
      x = { bg = theme.ui.bg_p1, fg = theme.syn.comment },
      y = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
    }
    kanagawa.replace = {
      a = { bg = theme.syn.constant, fg = theme.ui.bg, gui = 'bold' },
      b = { bg = theme.ui.bg_p1, fg = theme.syn.constant },
      x = { bg = theme.ui.bg_p1, fg = theme.syn.comment },
      y = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
    }
    kanagawa.inactive = {
      a = { bg = theme.ui.bg_p1, fg = theme.ui.fg_dim },
      b = { bg = theme.ui.bg_p1, fg = theme.ui.fg_dim, gui = 'bold' },
      c = { bg = theme.ui.bg_p1, fg = theme.syn.comment },
      x = { bg = theme.ui.bg_p1, fg = theme.syn.comment },
      z = { bg = theme.ui.bg_p1, fg = theme.syn.comment },
    }
    if vim.g.kanagawa_lualine_bold then
      for _, mode in pairs(kanagawa) do
        mode.a.gui = 'bold'
      end
    end

    require('lualine').setup({
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'neotree' } },
        theme = kanagawa,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {},
        lualine_x = {
          'encoding',
          {
            'fileformat',
            symbols = {
              unix = 'LF',
              dos = 'CRLF',
              mac = 'CR',
            },
          },
        },
        lualine_y = {
          {
            'diagnostics',
            symbols = {
              error = '󰔶 ',
              warn = '󰔶 ',
              info = ' ',
              hint = '⚑ ',
            },
          },
        },
        lualine_z = { 'filename' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'filename' },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
