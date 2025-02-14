return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = {
    'rafamadriz/friendly-snippets',
    {
      'fang2hou/blink-copilot',
      opts = {
        max_completions = 1, -- Global default for max completions
        max_attempts = 2, -- Global default for max attempts
      },
    },
  },
  version = '*',
  opts = {
    signature = { enabled = true },
    completion = {
      menu = { draw = { treesitter = { 'lsp' } } },
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },
    sources = {
      -- default = { 'copilot', 'lsp', 'path', 'snippets', 'buffer' },
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          score_offset = 100,
          async = true,
          opts = {
            -- Local options override global ones
            -- Final settings: max_completions = 3, max_attempts = 2, kind = "Copilot"
            max_completions = 3, -- Override global max_completions
          },
        },
      },
    },
    appearance = {
      kind_icons = {
        Copilot = '',
      },
    },
    keymap = {
      ['<C-e>'] = { 'hide' },
      ['<CR>'] = { 'accept', 'snippet_forward', 'fallback' },
      ['<Tab>'] = { 'accept', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'show', 'select_next', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      cmdline = {
        ['<C-e>'] = { 'hide' },
        ['<Tab>'] = { 'accept', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'show', 'select_next', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      },
    },
  },
}
