return {
  'folke/which-key.nvim',
  keys = { '<leader>', '"' },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require('which-key').setup({})
    require('which-key').register({
      ['<leader>'] = {
        f = {
          name = 'find',
        },
        o = {
          name = 'obsidian',
        },
        g = {
          name = 'github',
        },
        n = {
          name = 'util',
        },
      },
    })
  end,
}
