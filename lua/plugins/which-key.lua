return {
  'folke/which-key.nvim',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require('which-key').setup({})
    require('which-key').register({
      ['<leader>'] = {
        f = {
          name = 'Find',
        },
        o = {
          name = 'Obsidian',
        },
        g = {
          name = 'Github',
        },
        u = {
          name = 'Util',
        },
        t = {
          name = 'Toggle / Tests',
        },
        tt = {
          name = 'Test',
        },
        ['"'] = {
          name = 'Format',
        },
      },
    })
  end,
}
