vim.o.timeout = true
vim.o.timeoutlen = 300

require('which-key').setup()
require('which-key').add({
  { '<leader>"',  group = 'Format' },
  { '<leader>f',  group = 'Find' },
  { '<leader>g',  group = 'Github' },
  { '<leader>t',  group = 'Toggle / Tests' },
  { '<leader>tt', group = 'Test' },
  { '<leader>u',  group = 'Util' },
})
