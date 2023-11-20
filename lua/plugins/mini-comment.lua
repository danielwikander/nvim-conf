return {
  'echasnovski/mini.comment',
  version = false,
  dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  config = function()
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
