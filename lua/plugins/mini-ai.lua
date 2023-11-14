return {
  'echasnovski/mini.ai',
  event = 'BufReadPost',
  version = false,
  config = function()
    require('mini.ai').setup({
      mappings = {
        -- Main textobject prefixes
        around = 'a',
        inside = 'i',

        -- Next/last variants
        around_next = 'an',
        inside_next = 'in',
        around_last = 'aN',
        inside_last = 'iN',

        -- Move cursor to corresponding edge of `a` textobject
        goto_left = 'g[',
        goto_right = 'g]',
      },
    })
  end,
}
