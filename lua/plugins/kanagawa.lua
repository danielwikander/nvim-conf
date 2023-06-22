return
{
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('kanagawa').setup({
            theme = 'dragon',
            compile = true,
            colors = { theme = { all = { ui = { bg_gutter = 'none' } } } },
            dimInactive = false,
            overrides = function(colors)
                local theme = colors.theme
                return {
                    TelescopeTitle = { fg = theme.ui.bg },
                    TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                    TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                    TelescopeResultsNormal = { bg = theme.ui.bg_m1 },
                    TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                    TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                    TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
                    Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                    PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
                    PmenuSbar = { bg = theme.ui.bg_m1 },
                    PmenuThumb = { bg = theme.ui.bg_p2 },
                    NormalFloat = { bg = theme.ui.bg_p1 },
                    FloatBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                    FloatTitle = { bg = 'none' },
                    NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                    LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    TreeDiagnosticSignHint = { bg = theme.ui.bg, fg = theme.diag.hint },
                    TreeDiagnosticSignInfo = { bg = theme.ui.bg, fg = theme.diag.info },
                    TreeDiagnosticSignWarn = { bg = theme.ui.bg, fg = theme.diag.warning },
                    TreeDiagnosticSignError = { bg = theme.ui.bg, fg = theme.diag.error },
                    CmpDocumentationBorder = { bg = theme.ui.bg_p1, fg = theme.ui.bg_p1 },
                    Todo = { bg = theme.ui.bg, fg = theme.diag.warning },
                    IndentBlankLineChar = { fg = theme.ui.bg_p1 },
                    TabLine = { bg = theme.ui.bg_m3 },
                    TabLineSel = { bg = theme.ui.bg },
                    TabLineFill = { bg = theme.ui.bg_m3 },
                    BufferTabpageFill = { bg = theme.ui.bg_m3 },
                    WinSeparator = { fg = theme.ui.bg_p1 },
                    HarpoonWindow = { fg = theme.ui.shade0, bg = theme.ui.bg_m1},
                    HarpoonBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1},
                }
            end,
        })
        vim.cmd('colorscheme kanagawa-dragon')
    end,
}
