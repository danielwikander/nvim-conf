return {
  'nvim-mini/mini.comment',
  version = false,
  keys = {
    { 'cc', desc = 'Line comment' },
    { 'cc', mode = 'v', desc = 'Line comment visual mode' },
    { 'gc', mode = 'v', desc = 'Comment textobject' },
  },
  dependencies = {
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      opts = {
        enable_autocmd = false,
      },
    },
  },
  config = function()
    vim.g.skip_ts_context_commentstring_module = true
    require('mini.comment').setup({
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
        end,
      },
      mappings = {
        comment = 'gc',
        comment_line = 'cc',
        comment_visual = 'cc',
        textobject = 'gc',
      },
    })
  end,
}
