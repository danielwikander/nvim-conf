return {
  'echasnovski/mini.surround',
  config = function()
    require('mini.surround').setup({
      mappings = {
        add = 'gsa', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        find = '', -- Find surrounding (to the right)
        find_left = '', -- Find surrounding (to the left)
        highlight = 'gsh', -- Highlight surrounding
        replace = 'gsr', -- Replace surrounding
        update_n_lines = 'gsn', -- Update `n_lines`
        suffix_last = '', -- Suffix to search with "prev" method
        suffix_next = '', -- Suffix to search with "next" method
      },
    })
  end,
}
