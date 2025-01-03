IGNORE_FILE_PATTERNS = { 'cypress/*' }
-- Search for git files if in git folder, else normal file search
local function find_project_files(include_all)
  if include_all then
    local ok = pcall(require('telescope.builtin').git_files, { show_untracked = true })
    if not ok then
      require('telescope.builtin').find_files()
    end
  else
    local ok = pcall(
      require('telescope.builtin').git_files,
      { show_untracked = true, file_ignore_patterns = IGNORE_FILE_PATTERNS }
    )
    if not ok then
      require('telescope.builtin').find_files({
        file_ignore_patterns = IGNORE_FILE_PATTERNS,
      })
    end
  end
end

return {
  'nvim-telescope/telescope.nvim',
  enabled = false,
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
    {
      '<leader>P',
      function()
        require('telescope.builtin').live_grep({
          file_ignore_patterns = { '%.lock' },
          disable_coordinates = true,
          additional_args = { '--hidden' },
        })
      end,
      desc = 'Search string (exclude tests)',
    },
    {
      '<leader>p',
      function()
        require('telescope.builtin').live_grep({
          disable_coordinates = true,
          file_ignore_patterns = { '%.lock' },
        })
      end,
      desc = 'Search string',
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
        require('telescope.builtin').grep_string({ disable_coordinates = true })
      end,
      desc = 'Search word',
    },
    {
      '<leader>fr',
      function()
        require('telescope.builtin').oldfiles({ only_cwd = true })
      end,
      desc = 'Recent files (in cwd)',
    },
    {
      '<leader>fR',
      function()
        require('telescope.builtin').oldfiles()
      end,
      desc = 'Recent files',
    },
    {
      '<leader>ff',
      function()
        require('telescope.builtin').find_files({ find_command = { 'fd' } })
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
        find_project_files(false)
      end,
      desc = 'Search git files, ignore some',
    },
    {
      '<S-C-p>',
      function()
        find_project_files(true)
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
      desc = 'Projects',
    },
    {
      '<leader>fh',
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = 'Help tags',
    },
    {
      '<leader>ft',
      ':Telescope<CR>',
      desc = 'Other pickers..',
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
      pickers = {
        find_files = {
          follow = true,
          hidden = true,
          find_command = {
            'fd',
            '--type',
            'f',
            '--color',
            'never',
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
        project = {
          -- default for on_project_selected = find project files
          on_project_selected = function(prompt_bufnr)
            require('telescope').extensions.projects.actions.project_actions.change_working_directory(
              prompt_bufnr,
              false
            )
          end,
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
