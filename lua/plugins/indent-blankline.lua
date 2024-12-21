return {
  'lukas-reineke/indent-blankline.nvim',
  enabled = false,
  main = 'ibl',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('ibl').setup({
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
      },
      scope = {
        show_start = false,
        include = {
          node_type = {
            ['*'] = { '*' },
          },
        },
      },
    })
  end,
}
