return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  config = function()
    require('kanagawa').setup({
      theme = 'dragon',
      colors = { theme = { all = { ui = { bg_gutter = 'none' } } } },
      transparent = true,
      dimInactive = false,
      overrides = function(colors)
        local theme = colors.theme
        local palette = colors.palette
        return {
          -- Telescope
          TelescopeTitle = { fg = theme.ui.bg },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

          -- Float
          NormalFloat = { bg = theme.ui.bg_p1 },
          FloatBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          FloatTitle = { bg = 'none' },

          -- Lazy
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- Mason
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- Diagnostics
          DiagnosticError = { fg = theme.vcs.removed },
          DiagnosticSignError = { fg = theme.vcs.removed },
          TreeDiagnosticSignHint = { bg = theme.ui.bg, fg = theme.diag.hint },
          TreeDiagnosticSignInfo = { bg = theme.ui.bg, fg = theme.diag.info },
          TreeDiagnosticSignWarn = { bg = theme.ui.bg, fg = theme.diag.warning },
          TreeDiagnosticSignError = { bg = theme.ui.bg, fg = theme.diag.error },

          -- Harpoon
          HarpoonWindow = { fg = theme.ui.shade0, bg = theme.ui.bg_m1 },
          HarpoonBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },

          -- NeoTree
          NeoTreeTitleBar = { fg = theme.ui.fg },
          NeoTreeFloatTitle = { fg = theme.ui.fg },

          -- Tabline
          TabLine = { bg = theme.ui.bg_m3 },
          TabLineSel = { bg = theme.ui.bg },
          TabLineFill = { bg = theme.ui.bg_m3 },
          BufferTabpageFill = { bg = theme.ui.bg_m3 },

          -- Darker, more subtle indent lines
          IblIndent = { fg = '#21201d' }, -- somewhere between bg_m1 and bg_m2
          NeoTreeIndentMarker = { fg = '#21201d' }, -- somewhere between bg_m1 and bg_m2
          IblScope = { fg = theme.ui.bg_p2 },

          -- Misc
          WinSeparator = { fg = theme.ui.bg_p1 },
          Todo = { bg = theme.ui.bg, fg = theme.diag.warning },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Pmenu
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },

          -- Cmp
          CmpDocumentationBorder = { bg = theme.ui.bg_p1, fg = theme.ui.bg_p1 },

          CmpItemAbbrDeprecated = { fg = palette.katanaGray, strikethrough = true },

          CmpItemKindField = { fg = palette.waveRed },
          CmpItemKindProperty = { fg = palette.waveRed },
          CmpItemKindEvent = { fg = palette.waveRed },

          CmpItemKindText = { fg = palette.springGreen },
          CmpItemKindEnum = { fg = palette.springGreen },
          CmpItemKindKeyword = { fg = palette.springGreen },

          CmpItemKindConstant = { fg = palette.carpYellow },
          CmpItemKindConstructor = { fg = palette.carpYellow },
          CmpItemKindReference = { fg = palette.carpYellow },

          CmpItemKindFunction = { fg = palette.dragonPink },
          CmpItemKindStruct = { fg = palette.dragonPink },
          CmpItemKindClass = { fg = palette.dragonPink },
          CmpItemKindModule = { fg = palette.dragonPink },
          CmpItemKindOperator = { fg = palette.dragonPink },

          CmpItemKindVariable = { fg = palette.dragonBlue2 },
          CmpItemKindFile = { fg = palette.dragonBlue2 },

          CmpItemKindUnit = { fg = palette.dragonYellow },
          CmpItemKindSnippet = { fg = palette.dragonYellow },
          CmpItemKindFolder = { fg = palette.dragonYellow },

          CmpItemKindMethod = { fg = palette.dragonBlue2 },
          CmpItemKindValue = { fg = palette.dragonBlue2 },
          CmpItemKindEnumMember = { fg = palette.dragonBlue2 },

          CmpItemKindInterface = { fg = palette.lightBlue },
          CmpItemKindColor = { fg = palette.lightBlue },
          CmpItemKindTypeParameter = { fg = palette.lightBlue },

          MiniFilesNormal = { fg = palette.fujiWhite, bg = theme.ui.bg_p1 },
          MiniFilesBorder = { bg = theme.ui.bg_p1, fg = theme.ui.bg_p1 },
          MiniFilesBorderModified = { fg = palette.surimiOrange, bg = theme.ui.bg_p1 },
          MiniFilesTitle = { bg = theme.ui.bg_p1, fg = palette.katanaGray },
          MiniFilesTitleFocused = { bg = theme.ui.bg_p1, fg = palette.waveRed, bold = true },

          DashboardDesc = { fg = palette.fujiWhite },

          WhichKeyFloat = { bg = theme.ui.bg_p3 },

          MiniHipatternsTodo = { bg = palette.surimiOrange, fg = theme.ui.bg, bold = true },
          MiniHipatternsNote = { bg = palette.springGreen, fg = theme.ui.bg, bold = true },
          MiniHipatternsHack = { bg = palette.surimiOrange, fg = theme.ui.bg, bold = true },
          MiniHipatternsFixme = { bg = palette.waveRed, fg = theme.ui.bg, bold = true },

          FidgetProgress = { fg = palette.dragonBlue2 },
          FidgetCompleted = { fg = palette.springGreen },

          StatusLine = { bg = theme.ui.bg_p1, fg = theme.ui.bg_p1 },
          StatusLineNC = { bg = theme.ui.bg_p1, fg = theme.ui.bg_p1 },

          MatchParen = { fg = palette.springGreen },
          YankHighlight = { fg = palette.springGreen, bg = theme.ui.bg_p2 },
        }
      end,
    })
    vim.cmd('colorscheme kanagawa-dragon')
  end,
}
