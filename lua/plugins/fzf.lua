return {
  'ibhagwan/fzf-lua',
  opts = function()
    local config = require('fzf-lua.config')
    local actions = require('fzf-lua.actions')

    -- Quickfix
    config.defaults.keymap.fzf['ctrl-q'] = 'select-all+accept'
    config.defaults.keymap.fzf['ctrl-u'] = 'half-page-up'
    config.defaults.keymap.fzf['ctrl-d'] = 'half-page-down'
    config.defaults.keymap.fzf['ctrl-x'] = 'jump'
    config.defaults.keymap.fzf['ctrl-f'] = 'preview-page-down'
    config.defaults.keymap.fzf['ctrl-b'] = 'preview-page-up'
    config.defaults.keymap.builtin['<c-f>'] = 'preview-page-down'
    config.defaults.keymap.builtin['<c-b>'] = 'preview-page-up'

    return {
      'default-title',
      fzf_colors = true,
      fzf_opts = {
        ['--no-scrollbar'] = true,
        ['--info'] = 'hidden',
        ['--header'] = ' ',
      },
      defaults = {
        formatter = 'path.filename_first',
      },
      winopts = {
        width = 0.9,
        height = 0.9,
        row = 0.5,
        col = 0.5,
        border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        preview = {
          scrollchars = { '┃', '' },
          delay = 55,
          border = 'noborder',
        },
        treesitter = true,
      },
      preview = {
        border = 'noborder',
      },
      prompt = '',
      files = {
        cwd_prompt = false,
        cwd_header = false,
        prompt = '',
        no_header = true,
        actions = {
          ['ctrl-t'] = { actions.toggle_ignore },
          ['alt-i'] = { actions.toggle_ignore },
          ['alt-h'] = { actions.toggle_hidden },
        },
      },
      buffers = {
        prompt = '',
        no_header = true,
      },
      grep = {
        prompt = '',
        no_header = true,
        actions = {
          ['ctrl-t'] = { actions.toggle_ignore },
          ['alt-i'] = { actions.toggle_ignore },
          ['alt-h'] = { actions.toggle_hidden },
        },
      },
      gitfiles = {
        prompt = '',
      },
      oldfiles = {
        include_current_session = true,
      },
      lsp = {
        symbols = {
          symbol_hl = function(s)
            return 'TroubleIcon' .. s
          end,
          symbol_fmt = function(s)
            return s:lower() .. '\t'
          end,
          child_prefix = false,
        },
        code_actions = {
          previewer = 'codeaction_native',
        },
      },
      keymap = {
        builtin = {
          -- false, -- do not inherit from defaults
          ['<M-Esc>'] = 'hide', -- hide fzf-lua, `:FzfLua resume` to continue
          ['<F1>'] = 'toggle-help',
          ['<F2>'] = 'toggle-fullscreen',
          -- Only valid with the 'builtin' previewer
          ['<F3>'] = 'toggle-preview-wrap',
          ['<F4>'] = 'toggle-preview',
          -- Rotate preview clockwise/counter-clockwise
          ['<F5>'] = 'toggle-preview-ccw',
          ['<F6>'] = 'toggle-preview-cw',
          -- `ts-ctx` binds require `nvim-treesitter-context`
          ['<F7>'] = 'toggle-preview-ts-ctx',
          ['<F8>'] = 'preview-ts-ctx-dec',
          ['<F9>'] = 'preview-ts-ctx-inc',
          ['<S-Left>'] = 'preview-reset',
          ['<S-down>'] = 'preview-page-down',
          ['<S-up>'] = 'preview-page-up',
          ['<M-S-down>'] = 'preview-down',
          ['<M-S-up>'] = 'preview-up',
          ['<C-d>'] = 'preview-page-down',
          ['<C-u>'] = 'preview-page-up',
        },
        fzf = {
          -- false, -- do not inherit from defaults
          ['ctrl-z'] = 'abort',
          ['ctrl-u'] = 'unix-line-discard',
          ['ctrl-f'] = 'half-page-down',
          ['ctrl-b'] = 'half-page-up',
          ['ctrl-a'] = 'beginning-of-line',
          ['ctrl-e'] = 'end-of-line',
          ['alt-a'] = 'toggle-all',
          ['alt-g'] = 'first',
          ['alt-G'] = 'last',
          -- Only valid with fzf previewers (bat/cat/git/etc)
          ['f3'] = 'toggle-preview-wrap',
          ['f4'] = 'toggle-preview',
          ['shift-down'] = 'preview-page-down',
          ['shift-up'] = 'preview-page-up',
          -- ['<C-d>'] = 'preview-down',
          -- ['<C-u>'] = 'preview-up',
        },
      },
      actions = {
        files = {
          -- false, -- do not inherit from defaults
          ['enter'] = actions.file_edit_or_qf,
          ['ctrl-s'] = actions.file_split,
          ['ctrl-v'] = actions.file_vsplit,
          ['ctrl-t'] = actions.file_tabedit,
          ['alt-q'] = actions.file_sel_to_qf,
          ['alt-Q'] = actions.file_sel_to_ll,
        },
      },
    }
  end,
  -- config = function(_, opts)
  --   if opts[1] == 'default-title' then
  --     -- use the same prompt for all pickers for profile `default-title` and
  --     -- profiles that use `default-title` as base profile
  --     local function fix(t)
  --       t.prompt = t.prompt ~= nil and ' ' or nil
  --       for _, v in pairs(t) do
  --         if type(v) == 'table' then
  --           fix(v)
  --         end
  --       end
  --       return t
  --     end
  --     opts = vim.tbl_deep_extend('force', fix(require('fzf-lua.profiles.default-title')), opts)
  --     opts[1] = nil
  --   end
  --   require('fzf-lua').setup(opts)
  -- end,
  keys = {
    { '<c-j>', '<c-j>', ft = 'fzf', mode = 't', nowait = true },
    { '<c-k>', '<c-k>', ft = 'fzf', mode = 't', nowait = true },
    {
      '<leader>,',
      '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>',
      desc = 'Switch Buffer',
    },
    { '<leader>p', '<cmd>FzfLua live_grep<cr>', desc = 'Grep (Root Dir)' },
    { '<leader>:', '<cmd>FzfLua command_history<cr>', desc = 'Command History' },
    { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find Files (Root Dir)' },
    { '<leader>sf', '<cmd>FzfLua files<cr>', desc = 'Find Files (Root Dir)' },
    {
      '<C-p>',
      function()
        require('fzf-lua').git_files({ prompt = '', cmd = 'git ls-files --cached --exclude-standard --others' })
      end,
      desc = 'Find Files (git-files)',
    },
    -- find
    { '<leader>fb', '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>', desc = 'Buffers' },
    { '<leader>fr', '<cmd>FzfLua oldfiles<cr>', desc = 'Recent' },
    -- git
    { '<leader>fg', '<cmd>FzfLua git_files<cr>', desc = 'Find Files (git-files)' },
    { '<leader>gc', '<cmd>FzfLua git_commits<CR>', desc = 'Commits' },
    { '<leader>gs', '<cmd>FzfLua git_status<CR>', desc = 'Status' },
    -- search
    { '<leader>s"', '<cmd>FzfLua registers<cr>', desc = 'Registers' },
    { '<leader>sa', '<cmd>FzfLua autocmds<cr>', desc = 'Auto Commands' },
    { '<leader>sb', '<cmd>FzfLua grep_curbuf<cr>', desc = 'Buffer' },
    { '<leader>sc', '<cmd>FzfLua command_history<cr>', desc = 'Command History' },
    { '<leader>sC', '<cmd>FzfLua commands<cr>', desc = 'Commands' },
    { '<leader>sd', '<cmd>FzfLua diagnostics_document<cr>', desc = 'Document Diagnostics' },
    { '<leader>E', '<cmd>FzfLua diagnostics_document<cr>', desc = 'Document Diagnostics' },
    { '<leader>sD', '<cmd>FzfLua diagnostics_workspace<cr>', desc = 'Workspace Diagnostics' },
    { '<leader>sh', '<cmd>FzfLua help_tags<cr>', desc = 'Help Pages' },
    { '<leader>sH', '<cmd>FzfLua highlights<cr>', desc = 'Search Highlight Groups' },
    { '<leader>sj', '<cmd>FzfLua jumps<cr>', desc = 'Jumplist' },
    { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = 'Key Maps' },
    { '<leader>sl', '<cmd>FzfLua loclist<cr>', desc = 'Location List' },
    { '<leader>sM', '<cmd>FzfLua man_pages<cr>', desc = 'Man Pages' },
    { '<leader>sm', '<cmd>FzfLua marks<cr>', desc = 'Jump to Mark' },
    { '<leader>sr', '<cmd>FzfLua resume<cr>', desc = 'Resume' },
    { '<leader>sq', '<cmd>FzfLua quickfix<cr>', desc = 'Quickfix List' },
    --lsp
    { 'gd', '<cmd>FzfLua lsp_definitions<cr>', desc = 'Definitions' },
    { 'gr', '<cmd>FzfLua lsp_references<cr>', desc = 'References' },
    {
      '<leader><cr>',
      function()
        require('fzf-lua').lsp_code_actions({
          prompt = '',
          winopts = {
            relative = 'cursor',
            -- width = 120,
            -- height = 30,
            row = 1,
            preview = { horizontal = 'right:50%', border = 'noborder' },
          },
        })
      end,
      desc = 'Code actions',
    },
    -- { '<leader>sw', LazyVim.pick('grep_cword'), desc = 'Word (Root Dir)' },
    -- { '<leader>sW', LazyVim.pick('grep_cword', { root = false }), desc = 'Word (cwd)' },
    -- { '<leader>sw', LazyVim.pick('grep_visual'), mode = 'v', desc = 'Selection (Root Dir)' },
    -- { '<leader>sW', LazyVim.pick('grep_visual', { root = false }), mode = 'v', desc = 'Selection (cwd)' },
    -- { '<leader>uC', LazyVim.pick('colorschemes'), desc = 'Colorscheme with Preview' },
  },
  cmd = 'FzfLua',
}
