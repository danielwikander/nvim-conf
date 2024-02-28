-- Search for git files if in git folder, else normal file search
local function find_project_files()
  local ok = pcall(require('telescope.builtin').git_files, { show_untracked = true })
  if not ok then
    require('telescope.builtin').find_files()
  end
end

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'debugloop/telescope-undo.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    {
      'ahmedkhalf/project.nvim',
      config = function()
        require('project_nvim').setup()
      end,
    },
  },
  cmd = 'Telescope',
  keys = {
    -- local builtin = require 'telescope.builtin'
    --       vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    --       vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    --       vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    --       vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    --       vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    --       vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    --       vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    --       vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    --       vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    --- Slightly advanced example of overriding default behavior and theme
    -- vim.keymap.set('n', '<leader>/', function()
    --   -- You can pass additional configuration to telescope to change theme, layout, etc.
    --   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    --     winblend = 10,
    --     previewer = false,
    --   })
    -- end, { desc = '[/] Fuzzily search in current buffer' })
    --
    -- -- Also possible to pass additional configuration options.
    -- --  See `:help telescope.builtin.live_grep()` for information about particular keys
    -- vim.keymap.set('n', '<leader>s/', function()
    --   builtin.live_grep {
    --     grep_open_files = true,
    --     prompt_title = 'Live Grep in Open Files',
    --   }
    -- end, { desc = '[S]earch [/] in Open Files' })-       vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    {
      '<leader>p',
      function()
        require('telescope.builtin').live_grep({ file_ignore_patterns = { '%.test.tsx' }, disable_coordinates = true })
      end,
      desc = 'Search string',
    },
    {
      '<leader>P',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = 'Search string (include tests)',
    },
    {
      '<leader>fs',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = 'Search string',
    },
    {
      '<leader>fw',
      function()
        require('telescope.builtin').grep_string()
      end,
      desc = 'Search word',
    },
    {
      '<leader>fr',
      function()
        require('telescope.builtin').oldfiles()
      end,
      desc = 'Recent files',
    },
    {
      '<leader>ff',
      function()
        require('telescope.builtin').find_files()
      end,
      desc = 'Files',
    },
    {
      '<leader>fm',
      function()
        require('telescope.builtin').marks()
      end,
      desc = 'Marks',
    },
    {
      '<C-p>',
      function()
        find_project_files()
      end,
      desc = 'Search git files',
    },
    {
      '<leader>fu',
      '<cmd>Telescope undo<cr>',
      desc = 'Undo tree',
    },
    {
      '<leader>0',
      '<cmd>Telescope harpoon marks<cr>',
      desc = 'Harpoon marks',
    },
    {
      '<leader>E',
      function()
        require('telescope.builtin').diagnostics()
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>fe',
      function()
        require('telescope.builtin').diagnostics()
      end,
      desc = 'Diagnostics',
    },
    {
      'gr',
      function()
        require('telescope.builtin').lsp_references({
          file_ignore_patterns = { '%.test.tsx' },
          include_declaration = false,
        })
      end,
      desc = 'References',
    },
    {
      'gR',
      function()
        require('telescope.builtin').lsp_references()
      end,
      desc = 'References (include tests)',
    },
    {
      'gd',
      function()
        require('telescope.builtin').lsp_definitions()
      end,
      desc = 'Definition',
    },
    {
      'gD',
      function()
        require('telescope.builtin').lsp_definitions({ jump_type = 'vsplit' })
      end,
      desc = 'Definition (open in split)',
    },
    {
      '<leader>b',
      function()
        require('telescope.builtin').buffers({
          sort_mru = true,
          ignore_current_buffer = true,
        })
      end,
      desc = 'Buffers',
    },
    {
      '<leader>fb',
      function()
        require('telescope.builtin').buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader><CR>',
      function()
        vim.lsp.buf.code_action()
      end,
      desc = 'Code actions',
    },
    {
      '<leader>fp',
      function()
        require('telescope').extensions.projects.projects()
      end,
      desc = 'Buffers',
    },
  },
  lazy = true,
  config = function()
    local actions = require('telescope.actions')
    local undo = require('telescope-undo.actions')
    require('telescope').setup({
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
        },
        prompt_prefix = ' ',
        results_title = '',
        prompt_title = '',
        selection_caret = ' ',
        path_display = { 'truncate' },
        file_ignore_patterns = { 'node_modules', 'package%-lock.json' },
        layout_strategy = 'no_title',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            width = function(_, cols, _)
              if cols > 200 then
                return 200
              else
                return math.floor(cols * 0.92)
              end
            end,
          },
        },
        sorting_strategy = 'ascending',
        mappings = {
          i = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<down>'] = actions.cycle_history_next,
            ['<up>'] = actions.cycle_history_prev,
            ['<esc>'] = actions.close,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        undo = {
          side_by_side = false,
          mappings = {
            i = {
              ['<cr>'] = undo.yank_additions,
              ['<S-cr>'] = undo.yank_deletions,
              ['<C-cr>'] = undo.restore,
            },
          },
        },
      },
    })

    require('telescope.pickers.layout_strategies').no_title = function(picker, max_columns, max_lines, layout_config)
      local layout =
        require('telescope.pickers.layout_strategies').horizontal(picker, max_columns, max_lines, layout_config)
      layout.prompt.title = ''
      layout.results.title = ''
      return layout
    end

    require('telescope').load_extension('undo')
    require('telescope').load_extension('harpoon')
    require('telescope').load_extension('ui-select')
    require('telescope').load_extension('projects')
  end,
}
