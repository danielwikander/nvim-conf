vim.g.snacks_animate = false

require('snacks').setup({
  explorer = {
    enabled = true,
  },
  bigfile = { enabled = true },
  notifier = { enabled = false },
  quickfile = { enabled = true },
  statuscolumn = { enabled = false },
  words = { enabled = false },
  indent = {
    enabled = true,
    char = '▎',
    only_current = true,
    scope = {
      enabled = true,
      animate = { enabled = false },
      char = '▎',
      only_current = false,
    },
    blank = {
      char = '·',
    },
  },
  zen = { enabled = true, win = { backdrop = false, width = 0 } },
  lazygit = {
    win = {
      height = 0,
      width = 0,
    },
  },
  picker = {
    sources = {
      files = {
        transform = function(item)
          if item.file and item.file:match('%.cy%.') then
            item.score_add = (item.score_add or 0) - 30
          end
        end,
      },
      explorer = {
        layout = {
          hidden = { 'input' },
          layout = {
            box = 'vertical',
            position = 'left',
            width = 60,
            {
              win = 'input',
              border = 'none',
              height = 1,
            },
            {
              win = 'list',
              border = 'none',
            },
          },
        },
        win = {
          list = {
            keys = {
              ['L'] = 'confirm',
              ['H'] = 'explorer_close',
              ['<C-p>'] = 'picker_files',
            },
          },
        },
      },
    },
    matcher = {
      frecency = true,
    },
    formatters = {
      file = {
        filename_first = true,
        git_status_hl = true,
      },
    },
    win = {
      input = {
        keys = {
          ['<Down>'] = { 'history_forward', mode = { 'i', 'n' } },
          ['<Up>'] = { 'history_back', mode = { 'i', 'n' } },
          ['<Esc>'] = { 'close', mode = 'i' },
          ['<a-h>'] = { 'toggle_hidden', mode = { 'i', 'n' } },
          ['<a-i>'] = { 'toggle_ignored', mode = { 'i', 'n' } },
          ['<a-m>'] = { 'toggle_maximize', mode = { 'i', 'n' } },
          ['<a-p>'] = { 'toggle_preview', mode = { 'i', 'n' } },
          ['<c-b>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
          ['<c-f>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
          ['<c-v>'] = { 'edit_vsplit', mode = { 'i', 'n' } },
        },
      },
    },
    icons = {
      git = {
        enabled = true,
        added = '',
        deleted = '',
        modified = '',
        renamed = '',
        untracked = '',
        ignored = '',
        unstaged = '',
        staged = '',
        conflict = '',
      },
      diagnostics = {
        Error = '󰔶 ',
        Warn = '󰔶 ',
        Hint = '⚑ ',
        Info = ' ',
      },
    },
  },
  dashboard = {
    enabled = true,
    preset = {
      keys = {
        {
          icon = '󰈞 ',
          key = 'f',
          desc = 'Find File',
          action = function()
            Snacks.picker.files()
          end,
        },
        {
          icon = '󰝒 ',
          key = 'n',
          desc = 'New File',
          action = ':ene | startinsert',
        },
        {
          icon = '󰍉 ',
          key = 'p',
          desc = 'Find Text',
          action = function()
            Snacks.picker.grep()
          end,
        },
        {
          icon = '󱋢 ',
          key = 'r',
          desc = 'Recent Files',
          action = function()
            Snacks.picker.recent()
          end,
        },
        {
          icon = '󰒓 ',
          key = 'c',
          desc = 'Config',
          action = ':e $MYVIMRC | cd%:h',
        },
        {
          icon = '󰄉 ',
          key = 'd',
          desc = '.dotfiles',
          action = ':e ~/.dotfiles/',
        },
        {
          icon = '󱁤 ',
          key = 'M',
          desc = 'Mason',
          action = ':Mason',
        },
        {
          icon = '󰒲 ',
          key = 'L',
          desc = 'Update plugins',
          action = function()
            vim.cmd('lua vim.pack.update()')
          end,
        },
        {
          icon = '󰩈 ',
          key = 'q',
          desc = 'Quit',
          action = ':qa',
        },
      },
    },
    sections = {
      { icon = ' ', title = '', section = 'keys', indent = 0, padding = 4 },
      { icon = ' ', title = '', section = 'recent_files', indent = 0, padding = 6, cwd = true },
    },
  },
})

-- Snacks keymaps
vim.keymap.set('n', '<leader>tp', function()
  Snacks.toggle.profiler():map('<leader>tp')
end, { desc = 'Profiler' })

vim.keymap.set('n', '<leader>gg', function()
  Snacks.lazygit()
end, { desc = 'Lazygit' })

vim.keymap.set('n', '<leader>gb', function()
  Snacks.git.blame_line()
end, { desc = 'Git blame line' })

vim.keymap.set({ 'n', 'v' }, '<leader>gh', function()
  Snacks.gitbrowse()
end, { desc = 'Yank remote git link' })

vim.keymap.set({ 'n', 'v' }, '<leader>gH', function()
  Snacks.gitbrowse.open()
end, { desc = 'Open remote git link' })

vim.keymap.set('n', '<leader>gf', function()
  Snacks.lazygit.log_file()
end, { desc = 'Lazygit current file history' })

vim.keymap.set('n', '<leader>gl', function()
  Snacks.lazygit.log()
end, { desc = 'Lazygit log (cwd)' })

vim.keymap.set('n', '<leader>z', function()
  Snacks.zen()
end, { desc = 'Toggle Zen Mode' })

vim.keymap.set('n', '<leader>Z', function()
  Snacks.zen.zoom()
end, { desc = 'Toggle Zoom' })

vim.keymap.set('n', '<leader>fn', function()
  Snacks.picker.notifications()
end, { desc = 'Notifications' })

vim.keymap.set('n', '<leader>si', function()
  Snacks.picker.icons()
end, { desc = 'Icons' })

vim.keymap.set('n', '<leader>p', function()
  Snacks.picker.grep()
end, { desc = 'Grep' })

vim.keymap.set('n', '<leader>:', function()
  Snacks.picker.command_history()
end, { desc = 'Command History' })

vim.keymap.set('n', '<leader><space>', function()
  Snacks.picker.resume()
end, { desc = 'Resume' })

vim.keymap.set('n', '<leader>ff', function()
  Snacks.picker.files()
end, { desc = 'Find Files' })

vim.keymap.set('n', '<C-p>', function()
  Snacks.picker.files()
end, { desc = 'Find Files' })

vim.keymap.set('n', '<leader>fe', function()
  Snacks.picker.files({ hidden = true, ignored = true })
end, { desc = 'Find .env files' })

vim.keymap.set('n', '<leader>fb', function()
  Snacks.picker.buffers()
end, { desc = 'Buffers' })

vim.keymap.set('n', '<leader>fc', function()
  Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
end, { desc = 'Find Config File' })

vim.keymap.set('n', '<leader>fg', function()
  Snacks.picker.git_files()
end, { desc = 'Find Git Files' })

vim.keymap.set('n', '<leader>fr', function()
  Snacks.picker.recent({ filter = { cwd = true } })
end, { desc = 'Recent' })

vim.keymap.set('n', '<leader>gc', function()
  Snacks.picker.git_log()
end, { desc = 'Git Log' })

vim.keymap.set('n', '<leader>gs', function()
  Snacks.picker.git_status()
end, { desc = 'Git Status' })

vim.keymap.set('n', '<leader>sb', function()
  Snacks.picker.lines()
end, { desc = 'Buffer Lines' })

vim.keymap.set('n', '<leader>sB', function()
  Snacks.picker.grep_buffers()
end, { desc = 'Grep Open Buffers' })

vim.keymap.set('n', '<leader>sg', function()
  Snacks.picker.grep()
end, { desc = 'Grep' })

vim.keymap.set({ 'n', 'x' }, '<leader>sw', function()
  Snacks.picker.grep_word()
end, { desc = 'Visual selection or word' })

vim.keymap.set('n', '<leader>s"', function()
  Snacks.picker.registers()
end, { desc = 'Registers' })

vim.keymap.set('n', '<leader>sa', function()
  Snacks.picker.autocmds()
end, { desc = 'Autocmds' })

vim.keymap.set('n', '<leader>sc', function()
  Snacks.picker.command_history()
end, { desc = 'Command History' })

vim.keymap.set('n', '<leader>sC', function()
  Snacks.picker.commands()
end, { desc = 'Commands' })

vim.keymap.set('n', '<leader>sd', function()
  Snacks.picker.diagnostics()
end, { desc = 'Diagnostics' })

vim.keymap.set('n', '<leader>sD', function()
  Snacks.picker.diagnostics_buffer()
end, { desc = 'Buffer Diagnostics' })

vim.keymap.set('n', '<leader>E', function()
  Snacks.picker.diagnostics()
end, { desc = 'Diagnostics' })

vim.keymap.set('n', '<leader>sh', function()
  Snacks.picker.help()
end, { desc = 'Help Pages' })

vim.keymap.set('n', '<leader>sH', function()
  Snacks.picker.highlights()
end, { desc = 'Highlights' })

vim.keymap.set('n', '<leader>sj', function()
  Snacks.picker.jumps()
end, { desc = 'Jumps' })

vim.keymap.set('n', '<leader>sk', function()
  Snacks.picker.keymaps()
end, { desc = 'Keymaps' })

vim.keymap.set('n', '<leader>sl', function()
  Snacks.picker.loclist()
end, { desc = 'Location List' })

vim.keymap.set('n', '<leader>sM', function()
  Snacks.picker.man()
end, { desc = 'Man Pages' })

vim.keymap.set('n', '<leader>sm', function()
  Snacks.picker.marks()
end, { desc = 'Marks' })

vim.keymap.set('n', '<leader>sR', function()
  Snacks.picker.resume()
end, { desc = 'Resume' })

vim.keymap.set('n', '<leader>sq', function()
  Snacks.picker.qflist()
end, { desc = 'Quickfix List' })

vim.keymap.set('n', '<leader>uC', function()
  Snacks.picker.colorschemes()
end, { desc = 'Colorschemes' })

vim.keymap.set('n', '<leader>qp', function()
  Snacks.picker.projects()
end, { desc = 'Projects' })

vim.keymap.set('n', 'gd', function()
  Snacks.picker.lsp_definitions()
end, { desc = 'Goto Definition' })

vim.keymap.set('n', 'gr', function()
  Snacks.picker.lsp_references()
end, { desc = 'References', nowait = true })

vim.keymap.set('n', 'gI', function()
  Snacks.picker.lsp_implementations()
end, { desc = 'Goto Implementation' })

vim.keymap.set('n', 'gy', function()
  Snacks.picker.lsp_type_definitions()
end, { desc = 'Goto T[y]pe Definition' })

vim.keymap.set('n', '<leader>ss', function()
  Snacks.picker.lsp_symbols()
end, { desc = 'LSP Symbols' })

vim.keymap.set('n', '<leader>gp', function()
  Snacks.picker.gh_pr()
end, { desc = 'GitHub PR' })

vim.keymap.set('n', '<leader><tab>', function()
  Snacks.explorer()
end, { desc = 'File Explorer' })
