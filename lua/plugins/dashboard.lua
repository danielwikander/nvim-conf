return
{
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    opts = function()
        local logo =
        [[
_ __   ___  _____   _(_)_ __ ___
| '_ \ / _ \/ _ \ \ / / | '_ ` _ \
| | | |  __/ (_) \ V /| | | | | | |
|_| |_|\___|\___/ \_/ |_|_| |_| |_|
]]

        logo = string.rep('\n', 8) .. logo .. '\n\n'

        local opts = {
            theme = 'doom',
            hide = {
                statusline = false,
            },
            config = {
                header = vim.split(logo, '\n'),
                center = {
                    { action = 'Telescope find_files', desc = ' Find file', icon = ' ', key = 'f' },
                    { action = 'ene | startinsert', desc = ' New file', icon = ' ', key = 'a' },
                    { action = 'Telescope oldfiles', desc = ' Recent files', icon = ' ', key = 'r' },
                    { action = 'Telescope live_grep', desc = ' Find text', icon = ' ', key = 'p' },
                    { action = 'e $MYVIMRC | cd%:h', desc = ' Config', icon = ' ', key = 'c' },
                    { action = "lua require('persistence').load()", desc = ' Restore Session', icon = ' ', key = 's' },
                    { action = 'Lazy update', desc = ' Update', icon = ' ', key = 'u' },
                    { action = 'qa', desc = ' Quit', icon = ' ', key = 'q' },
                },
                footer = function()
                    local stats = require('lazy').stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    return { '⚡ Loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
                end,
            },
        }

        for _, button in ipairs(opts.config.center) do
            button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
        end

        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == 'lazy' then
            vim.cmd.close()
            vim.api.nvim_create_autocmd('User', {
                pattern = 'DashboardLoaded',
                callback = function()
                    require('lazy').show()
                end,
            })
        end

        return opts
    end,
}
