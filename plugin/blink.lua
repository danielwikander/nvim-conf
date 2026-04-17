require('blink.cmp').setup({
  signature = { enabled = true },
  completion = {
    menu = { draw = { treesitter = { 'lsp' } } },
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  cmdline = {
    keymap = {
      ['<C-e>'] = { 'hide' },
      ['<Tab>'] = { 'accept', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'show', 'select_next', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
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
  },
})

require('blink.pairs').setup({
  mappings = {
    cmdline = false,
    disabled_filetypes = { 'snacks_picker_input' },
  },
  highlights = {
    enabled = false,
    groups = {
      'BlinkPairsOrange',
      'BlinkPairsPurple',
      'BlinkPairsBlue',
    },
  },
})
