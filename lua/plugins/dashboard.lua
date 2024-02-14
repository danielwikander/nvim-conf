return {
  'glepnir/dashboard-nvim',
  event = 'UIEnter',
  opts = function()
    local version = 'v.' .. vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch
    local logo = [[
⠀⠀⠀⢀⠔⡀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⠀⠀
⠀⡠⠐⢅⢂⠂⡂⠀⠀⠀⠀⠀⠀⠐⡅⢕⠠⡀
⢊⢌⠪⡐⡐⡐⠨⢐⢀⠀⠀⠀⠀⠨⢌⠢⡑⡌
⢕⢐⠅⠕⡔⠨⠨⢐⢐⠠⠀⠀⠀⠨⡢⢣⢑⢌
⠕⢔⠱⡑⡄⠡⢑⢐⠐⢌⠐⠄⠀⠨⡊⡆⡕⠬
⢕⢱⠡⡣⡂⠀⠀⠢⡑⡐⢅⢑⠄⢘⢌⢆⢣⢍
⢕⢅⢇⢎⠂⠀⠀⠀⠂⡪⡐⡐⠅⢅⢇⢕⢕⢜
⢕⢕⢜⢜⠄⠀⠀⠀⠀⠐⠰⠨⡊⡢⡑⢕⢕⢕
⠈⠘⢜⢜⠄⠀⠀⠀⠀⠀⠈⠨⡂⡪⡸⠰⠑⠁
⠀⠀⠀⠑⠅⠀⠀⠀⠀⠀⠀⠀⠈⠜⠈⠀⠀⠀

]] .. version

    logo = string.rep('\n', 8) .. logo .. '\n\n'

    local opts = {
      theme = 'doom',
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(logo, '\n'),
        center = {
          {
            action = "lua require('telescope').extensions.projects.projects()",
            desc = ' Find project',
            icon = ' ',
            key = 'f',
            key_format = ' %s',
          },
          {
            action = 'ene | startinsert',
            desc = ' New file',
            icon = ' ',
            key = 'a',
            key_format = ' %s',
          },
          {
            action = 'Telescope oldfiles',
            desc = ' Recent files',
            icon = ' ',
            key = 'r',
            key_format = ' %s',
          },
          {
            action = 'Telescope live_grep',
            desc = ' Find text',
            icon = ' ',
            key = 'p',
            key_format = ' %s',
          },
          {
            action = 'e $MYVIMRC | cd%:h',
            desc = ' Config',
            icon = ' ',
            key = 'c',
            key_format = ' %s',
          },
          {
            action = "lua require('persistence').load()",
            desc = ' Restore Session',
            icon = ' ',
            key = 's',
            key_format = ' %s',
          },
          {
            action = 'Lazy update',
            desc = ' Update',
            icon = ' ',
            key = 'u',
            key_format = ' %s',
          },
          {
            action = 'qa',
            desc = ' Quit',
            icon = ' ',
            key = 'q',
            key_format = ' %s',
          },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { stats.loaded .. '/' .. stats.count .. ' in ' .. ms .. 'ms' }
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
