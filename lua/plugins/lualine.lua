return
{
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local theme = require("kanagawa.colors").setup().theme
        local kanagawa = {}
        kanagawa.normal = {
            a = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
            b = { bg = theme.diff.change, fg = theme.syn.fun },
            c = { bg = theme.ui.bg_p2, fg = theme.ui.fg },
        }
        kanagawa.insert = {
            a = { bg = theme.diag.ok, fg = theme.ui.bg },
            b = { bg = theme.ui.bg, fg = theme.diag.ok },
        }
        kanagawa.command = {
            a = { bg = theme.syn.operator, fg = theme.ui.bg },
            b = { bg = theme.ui.bg, fg = theme.syn.operator },
        }
        kanagawa.visual = {
            a = { bg = theme.syn.keyword, fg = theme.ui.bg },
            b = { bg = theme.ui.bg, fg = theme.syn.keyword },
        }
        kanagawa.replace = {
            a = { bg = theme.syn.constant, fg = theme.ui.bg },
            b = { bg = theme.ui.bg, fg = theme.syn.constant },
        }
        kanagawa.inactive = {
            a = { bg = theme.ui.bg, fg = theme.ui.fg_dim },
            b = { bg = theme.ui.bg, fg = theme.ui.fg_dim, gui = "bold" },
            c = { bg = theme.ui.bg, fg = theme.syn.comment },
        }
        if vim.g.kanagawa_lualine_bold then
            for _, mode in pairs(kanagawa) do
                mode.a.gui = "bold"
            end
        end

        require('lualine').setup {
            options = {
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                theme = kanagawa
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = { 'filename' },
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'diagnostics' },
            },
            inactive_sections = {
                lualine_c = { 'filename' },
                lualine_x = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}
