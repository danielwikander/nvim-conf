return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require "alpha"
        local headers = {
            nvim_1 = {
                [[                                         ]],
                [[    _ __   ___  _____   _(_)_ __ ___     ]],
                [[   | '_ \ / _ \/ _ \ \ / / | '_ ` _ \    ]],
                [[   | | | |  __/ (_) \ V /| | | | | | |   ]],
                [[   |_| |_|\___|\___/ \_/ |_|_| |_| |_|   ]],
                [[                                         ]],
            },
            nvim_2 = {
                [[                               __                ]],
                [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
                [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
                [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
                [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
                [[                                                 ]],
            }

        }

        local dashboard = require "alpha.themes.dashboard"
        dashboard.section.header.val = headers.nvim_1
        dashboard.section.buttons.val = {
            dashboard.button("p", "  Find File", ":Telescope find_files<CR>"),
            dashboard.button("a", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", "󰄉  Recent Files", ":Telescope oldfiles<CR>"),
            dashboard.button("t", "󰷾  Find Text", ":Telescope live_grep<CR>"),
            dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
            dashboard.button("u", "  Update Plugins", ":Lazy update<CR>"),
            dashboard.button("q", "  Quit Neovim", ":qa!<CR>"),
        }

        local footer = function()
            local version = "v." .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
            local lazy_ok, lazy = pcall(require, "lazy")
            if lazy_ok then
                local total_plugins = "         " .. lazy.stats().count .. " Plugins"
                local startuptime = (math.floor(lazy.stats().startuptime * 100 + 0.5) / 100)
                return version .. total_plugins .. "         " .. startuptime .. "ms"
            else
                return version
            end
        end
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                dashboard.section.footer.val = footer()
            end,
            desc = "Footer for Alpha",
        })

        dashboard.opts.opts.noautocmd = false
        alpha.setup(dashboard.opts)
    end
}
