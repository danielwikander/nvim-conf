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
          TelescopeDiffChanged = { fg = theme.vcs.changed },

          -- Fzf
          -- FzfLuaNormal = { bg = theme.ui.bg_p1 },
          -- FzfLuaPreviewNormal
          FzfLuaFzfSeparator = { fg = theme.ui.bg_dim },
          -- FzfLuaFzfPrompt = { bg = theme.ui.bg_m1 },
          FzfLuaPreviewNormal = { bg = theme.ui.bg_dim },
          FzfLuaPreviewBorder = { bg = theme.ui.bg_dim },
          FzfLuaFzfGutter = { bg = theme.ui.bg, fg = theme.ui.bg },
          FzfLuaFzfHeader = { bg = theme.ui.bg_dim },
          FzfLuaFzfQuery = { bg = theme.ui.bg_p1 },
          FzfLuaTitle = { bg = theme.ui.bg },
          FzfLuaPreviewTitle = { bg = theme.ui.bg },
          -- FzfLuaNormal = { bg = theme.ui.bg_p1 },
          FzfLuaFzfPrompt = { bg = theme.ui.bg_p1 },
          FzfLuaFzfPromptBorder = { bg = theme.ui.bg_p1 },

          -- Float
          NormalFloat = { bg = theme.ui.bg_p1 },
          FloatBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          FloatTitle = { bg = 'none' },

          -- Lazy
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          LazyTaskOutput = { fg = palette.katanaGray },

          -- Mason
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- Diagnostics
          DiagnosticError = { fg = theme.vcs.removed },
          DiagnosticSignError = { fg = theme.vcs.removed },
          DiagnosticFloatingError = { fg = theme.vcs.removed },
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

          -- Darker, more subtle indent lines
          SnacksIndent = { fg = '#21201d' },
          SnacksIndentScope = { fg = theme.ui.bg_p2 },
          SnacksIndentBlank = { fg = '#21201d' },
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

          -- Cursor
          CursorLine = { bg = theme.ui.bg_p1 },
          CursorLineNR = { fg = palette.springGreen, bold = true },

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

          NeotestAdapterName = { fg = palette.dragonBlue2, bold = true },
          NeotestBorder = { fg = palette.springGreen },
          NeotestDir = { fg = palette.dragonBlue2 },
          NeotestExpandMarker = { fg = '#21201d' },
          NeotestFailed = { fg = palette.waveRed },
          NeotestFile = { fg = palette.dragonBlue2 },
          NeotestFocused = { fg = palette.springGreen },
          NeotestIndent = { fg = '#21201d' },
          NeotestMarked = { fg = palette.surimiOrange },
          NeotestNamespace = { fg = palette.dragonBlue2 },
          NeotestPassed = { fg = palette.springGreen },
          NeotestRunning = { fg = palette.carpYellow },
          NeotestWinSelect = { fg = palette.springGreen },
          NeotestSkipped = { fg = palette.dragonBlue2 },
          NeotestTarget = { fg = palette.waveRed },
          NeotestUnknown = { fg = palette.springGreen },
          NeotestWatching = { fg = palette.carpYellow },

          TinyDiag = { bg = '#181616' },
          TinyInlineDiagnosticVirtualTextError = { bg = '#181616', fg = '#E46876' },
          TinyInlineDiagnosticVirtualTextWarn = { bg = '#181616', fg = '#E6C384' },
          TinyInlineDiagnosticVirtualTextInfo = { bg = '#181616', fg = '#7FB4CA' },
          TinyInlineDiagnosticVirtualTextHint = { bg = '#181616', fg = '#7FB4CA' },
          TinyInlineDiagnosticVirtualTextArrow = { bg = '#181616' },
          TinyInlineInvDiagnosticVirtualTextError = { bg = '#181616', fg = '#E46876' },
          TinyInlineInvDiagnosticVirtualTextWarn = { bg = '#181616', fg = '#E6C384' },
          TinyInlineInvDiagnosticVirtualTextInfo = { bg = '#181616', fg = '#7FB4CA' },
          TinyInlineInvDiagnosticVirtualTextHint = { bg = '#181616', fg = '#7FB4CA' },
        }
      end,
    })
    vim.cmd('colorscheme kanagawa-dragon')
  end,
}

--   "background-color": "#181616",
--   "foreground-color": "#C5C9C5",
--   "badge-color": "#181616",
--   "bold-color": "#72A7BC",
--   "cursor-color": "#C8C093",
--   "highlight-background-color": "#2D4F67",
--   "highlight-foreground-color": "#C8C093",
--   "palette": [
--     "#0D0C0C",
--     "#C4746E",
--     "#8A9A7B",
--     "#C4B28A",
--     "#8BA4B0",
--     "#A292A3",
--     "#8EA4A2",
--     "#C8C093",
--     "#A6A69C",
--     "#E46876",
--     "#87A987",
--     "#E6C384",
--     "#7FB4CA",
--     "#938AA9",
--     "#7AA89F",
--     "#C5C9C5"
--   ],
