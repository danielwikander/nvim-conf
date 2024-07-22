return {
  'folke/which-key.nvim',
  dependencies = { 'echasnovski/mini.icons' },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require('which-key').setup()
    require('which-key').add({
      { '<leader>"', group = 'Format' },
      { '<leader>f', group = 'Find' },
      { '<leader>g', group = 'Github' },
      { '<leader>o', group = 'Obsidian' },
      { '<leader>t', group = 'Toggle / Tests' },
      { '<leader>tt', group = 'Test' },
      { '<leader>u', group = 'Util' },
    })
  end,
}
