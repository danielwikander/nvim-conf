return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = 'rafamadriz/friendly-snippets',
  version = 'v0.*',
  opts = {
    highlight = {
      use_nvim_cmp_as_default = true,
    },
    nerd_font_variant = 'mono',
    -- experimental auto-brackets support
    accept = { auto_brackets = { enabled = true } },
    -- experimental signature help support
    trigger = { signature_help = { enabled = true } },
    keymap = {
      ['<C-Space>'] = { 'show' },
      ['<C-e>'] = { 'hide' },
      ['<CR>'] = { 'accept', 'snippet_forward', 'fallback' },
      ['<Tab>'] = { 'accept', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    },
  },
}
