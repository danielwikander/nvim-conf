return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  opts = {
    signature = { enabled = true },
    completion = {
      menu = { draw = { treesitter = { 'lsp' } } },
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
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
