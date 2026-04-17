-- mini.icons: mock nvim-web-devicons so other plugins use mini.icons
package.preload['nvim-web-devicons'] = function()
  require('mini.icons').mock_nvim_web_devicons()
  return package.loaded['nvim-web-devicons']
end
require('mini.icons').setup()

-- mini.ai
local spec_treesitter = require('mini.ai').gen_spec.treesitter
require('mini.ai').setup({
  custom_textobjects = {
    f = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
  },
  mappings = {
    around = 'a', inside = 'i',
    around_next = 'an', inside_next = 'in',
    around_last = 'aN', inside_last = 'iN',
    goto_left = 'g[', goto_right = 'g]',
  },
})

-- mini.bufremove
require('mini.bufremove').setup()

-- mini.comment
vim.g.skip_ts_context_commentstring_module = true
require('mini.comment').setup({
  options = {
    custom_commentstring = function()
      return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
    end,
  },
  mappings = { comment = 'gc', comment_line = 'cc', comment_visual = 'cc', textobject = 'gc' },
})

-- mini.cursorword
require('mini.cursorword').setup({ delay = 50 })

-- mini.hipatterns
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    fixme    = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack     = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack' },
    todo     = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo' },
    note     = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote' },
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

-- mini.surround
require('mini.surround').setup({
  mappings = {
    add           = 'gsa',
    delete        = 'gsd',
    find          = '',
    find_left     = '',
    highlight     = 'gsh',
    replace       = 'gsr',
    update_n_lines = 'gsn',
    suffix_last   = '',
    suffix_next   = '',
  },
})
