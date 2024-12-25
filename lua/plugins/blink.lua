return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  opts = {
    -- highlight = {
    -- use_nvim_cmp_as_default = true,
    -- },
    -- nerd_font_variant = 'mono',
    -- experimental auto-brackets support
    -- accept = { auto_brackets = { enabled = true } },
    -- experimental signature help support
    -- trigger = { signature_help = { enabled = true } },
    signature = { enabled = true },
    --   menu = {
    --     draw = {
    -- treesitter = true,
    -- components = {
    -- kind_icon = {
    --   ellipsis = false,
    --   text = function(ctx)
    --     local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
    --     return kind_icon
    --   end,
    --   -- Optionally, you may also use the highlights from mini.icons
    --   highlight = function(ctx)
    --     local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
    --     return hl
    --   end,
    -- },
    -- },
    --   },
    -- },
    -- },
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
