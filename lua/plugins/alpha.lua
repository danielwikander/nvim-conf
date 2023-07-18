return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    cmd = 'Alpha',
    config = function()
        local alpha = require 'alpha'
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

        local dashboard = require 'alpha.themes.dashboard'
        dashboard.section.header.val = headers.nvim_1
        dashboard.section.buttons.val = {
            dashboard.button('ctrl p', '  Find File', ':Telescope find_files<CR>'),
            dashboard.button('spc p', '󰷾  Find Text', ':Telescope live_grep<CR>'),
            dashboard.button('a', '  New file', ':ene <BAR> startinsert <CR>'),
            dashboard.button('r', '󰄉  Recent Files', ':Telescope oldfiles<CR>'),
            dashboard.button('c', '  Configuration', ':e $MYVIMRC<CR>:cd %:h<CR>'),
            dashboard.button('u', '  Update Plugins', ':Lazy update<CR>'),
            dashboard.button('q', '  Quit Neovim', ':qa!<CR>'),
        }

        dashboard.config.opts.leader = "ABC"
        dashboard.config.opts.noautocmd = true
        dashboard.opts.noautocmd = true
        dashboard.opts.leader = 'ABC'

        alpha.setup(dashboard.opts)

        vim.api.nvim_create_autocmd('User', {
            pattern = 'LazyVimStarted',
            callback = function()
                local version = 'v.' .. vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch
                local stats = require('lazy').stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = '   Neovim ' ..
                    version .. '       ' ..
                    stats.count .. ' plugins' .. '        ' ..
                    ms .. 'ms '
                pcall(vim.cmd.AlphaRedraw)
            end,
            desc = 'Footer for alpha'
        })
    end
}
