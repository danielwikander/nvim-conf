return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'echasnovski/mini.icons',
    'MunifTanjim/nui.nvim',
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      config = function()
        require('window-picker').setup({
          show_prompt = false,
          hint = 'floating-big-letter',
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            bo = {
              filetype = {
                'neo-tree',
                'neo-tree-popup',
                'notify',
                'noice',
                'fidget',
              },
              buftype = { 'terminal', 'quickfix' },
            },
          },
        })
      end,
    },
  },
  keys = {
    {
      '<leader><tab>',
      '<cmd>Neotree toggle<cr>',
      mode = { 'n', 'v' },
      desc = 'Toggle neotree',
    },
  },
  opts = function(_, opts)
    local function on_move(data)
      Snacks.rename.on_rename_file(data.source, data.destination)
    end
    local events = require('neo-tree.events')
    opts = {
      default_source = 'last',
      view = { adaptive_size = true },
      sources = {
        'filesystem',
        'buffers',
        'git_status',
      },
      popup_border_style = 'solid',
      use_default_mappings = false,
      default_component_configs = {
        diagnostics = {
          symbols = {
            hint = '⚑',
            info = '',
            warn = '󰔶',
            error = '󰔶',
          },
        },
        container = {
          enable_character_fade = true,
          width = '100%',
          right_padding = 0,
        },
        modified = {
          symbol = '+',
          highlight = 'NeoTreeModified',
        },
        git_status = {
          symbols = {
            -- Change type
            added = '', -- NOTE: you can set any of these to an empty string to not show them
            deleted = '',
            modified = '',
            renamed = '',
            -- Status type
            untracked = '',
            ignored = '',
            unstaged = '',
            staged = '',
            conflict = '',
          },
          align = 'right',
        },
        file_size = {
          enabled = true,
          required_width = 96, -- min width of window required to show this column
        },
        type = {
          enabled = true,
          required_width = 158, -- min width of window required to show this column
        },
        last_modified = {
          enabled = true,
          required_width = 120, -- min width of window required to show this column
        },
        created = {
          enabled = true,
          required_width = 142, -- min width of window required to show this column
        },
      },
      window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
        auto_expand_width = true,
        mappings = {
          ['<'] = 'prev_source',
          ['>'] = 'next_source',
          ['<2-LeftMouse>'] = 'open',
          ['<cr>'] = 'open',
          ['<esc>'] = 'cancel',
          ['<leader>h'] = 'open_split',
          ['<leader>s'] = 'split_with_window_picker',
          ['<leader>v'] = 'open_vsplit',
          ['<space>'] = { 'toggle_node', nowait = false },
          ['?'] = 'show_help',
          ['A'] = 'add_directory',
          ['H'] = 'close_node',
          ['K'] = 'show_file_details',
          ['L'] = 'open',
          ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = false } },
          ['R'] = 'refresh',
          ['a'] = { 'add', config = { show_path = 'none' } },
          ['c'] = 'copy',
          ['e'] = 'toggle_auto_expand_width',
          ['i'] = 'show_file_details',
          ['l'] = 'focus_preview',
          ['m'] = 'move',
          ['p'] = 'paste_from_clipboard',
          ['q'] = 'close_window',
          ['r'] = 'rename',
          ['W'] = 'open_with_window_picker',
          ['x'] = 'cut_to_clipboard',
          ['y'] = 'copy_to_clipboard',
          ['z'] = 'close_all_subnodes',
        },
      },
      filesystem = {
        window = {
          mappings = {
            ['#'] = 'fuzzy_sorter', -- fuzzy sorting using the fzy algorithm
            ['.'] = 'set_root',
            ['/'] = 'fuzzy_finder',
            ['3'] = 'fuzzy_sorter_directory',
            ['<bs>'] = 'navigate_up',
            ['<esc>'] = 'clear_filter',
            ['D'] = 'fuzzy_finder_directory',
            ['F'] = 'filter_on_submit',
            ['H'] = 'close_node',
            ['K'] = 'show_file_details',
            ['[g'] = 'prev_git_modified',
            [']g'] = 'next_git_modified',
            ['d'] = 'delete',
            ['f'] = 'filter_as_you_type',
            ['i'] = 'show_file_details',
            ['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
            ['oc'] = { 'order_by_created', nowait = false },
            ['od'] = { 'order_by_diagnostics', nowait = false },
            ['og'] = { 'order_by_git_status', nowait = false },
            ['om'] = { 'order_by_modified', nowait = false },
            ['on'] = { 'order_by_name', nowait = false },
            ['os'] = { 'order_by_size', nowait = false },
            ['ot'] = { 'order_by_type', nowait = false },
            ['t'] = 'toggle_hidden',
          },
          fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
            ['<C-j>'] = 'move_cursor_down',
            ['<C-k>'] = 'move_cursor_up',
            ['<down>'] = 'move_cursor_down',
            ['<up>'] = 'move_cursor_up',
          },
        },
        find_by_full_path_words = true, -- `false` means it only searches the tail of a path.
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
        },
        use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
      },
      buffers = {
        bind_to_cwd = true,
        follow_current_file = {
          enabled = true,
        },
        group_empty_dirs = true, -- when true, empty directories will be grouped together
        window = {
          mappings = {
            ['.'] = 'set_root',
            ['K'] = 'show_file_details',
            ['bd'] = 'buffer_delete',
            ['i'] = 'show_file_details',
            ['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
            ['oc'] = { 'order_by_created', nowait = false },
            ['od'] = { 'order_by_diagnostics', nowait = false },
            ['om'] = { 'order_by_modified', nowait = false },
            ['on'] = { 'order_by_name', nowait = false },
            ['os'] = { 'order_by_size', nowait = false },
            ['ot'] = { 'order_by_type', nowait = false },
          },
        },
      },
      git_status = {
        window = {
          mappings = {
            ['K'] = 'show_file_details',
            ['i'] = 'show_file_details',
            ['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
            ['oc'] = { 'order_by_created', nowait = false },
            ['od'] = { 'order_by_diagnostics', nowait = false },
            ['om'] = { 'order_by_modified', nowait = false },
            ['on'] = { 'order_by_name', nowait = false },
            ['os'] = { 'order_by_size', nowait = false },
            ['ot'] = { 'order_by_type', nowait = false },
          },
        },
      },
    }

    opts.event_handlers = opts.event_handlers or {}
    vim.list_extend(opts.event_handlers, {
      { event = events.FILE_MOVED, handler = on_move },
      { event = events.FILE_RENAMED, handler = on_move },
    })
    return opts
  end,
}
