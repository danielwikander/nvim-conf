local hls = {
  bg = 'PmenuSbar',
  sel = 'PmenuSel',
}
return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  branch = 'windows',
  keys = {
    {
      '<C-ö>',
      function()
        require('fzf-lua').files()
      end,
      desc = 'Fzf',
    },
  },
  config = function()
    require('fzf-lua').setup({
      winopts = {
        border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        preview = {
          scrollbar = 'float',
          scrolloff = '-2',
          title_pos = 'center',
        },
        on_create = function()
          vim.keymap.set('t', '<C-j>', '<Down>', { silent = true, buffer = true })
          vim.keymap.set('t', '<C-k>', '<Up>', { silent = true, buffer = true })
          vim.keymap.set('t', '<C-g>', '', { silent = true, buffer = true })
        end,
      },
      hls = {
        border = hls.bg,
        preview_border = hls.bg,
        preview_title = hls.sel,
        scrollfloat_e = '',
        scrollfloat_f = hls.sel,
      },
      fzf_colors = {
        ['gutter'] = { 'bg', hls.bg },
        ['bg'] = { 'bg', hls.bg },
        ['bg+'] = { 'bg', hls.sel },
        ['fg+'] = { 'fg', hls.sel },
        -- ["fg+"]    = { "fg", "", "reverse:-1" },
      },
      defaults = {
        git_icons = true,
        file_icons = true,
      },
      keymap = {
        builtin = {
          ['<C-d>'] = 'preview-page-down',
          ['<C-u>'] = 'preview-page-up',
          ['<C-j>'] = 'down',
          ['<C-k>'] = 'up',
        },
        fzf = {
          ['ctrl-u'] = 'preview-page-up',
          ['ctrl-d'] = 'preview-page-down',
          ['ctrl-j'] = 'down',
          ['ctrl-k'] = 'up',
        },
      },
      files = {
        cwd_prompt = false,
        fzf_opts = {
          ['--info'] = 'inline-right',
          ['--header'] = '',
          ['--scrollbar'] = '█',
        },
      },
    })
  end,
}
