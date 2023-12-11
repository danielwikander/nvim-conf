return {
  'akinsho/toggleterm.nvim',
  keys = {
    { '<C-t>', '<cmd>ToggleTerm<cr>', mode = { 'n', 't' }, desc = 'Toggle terminal' },
    { '<C-g>', '<cmd>lua ToggleLazygit()<CR>', mode = { 'n', 't' }, desc = 'Toggle lazygit' },
  },
  config = function()
    require('toggleterm').setup({
      size = 25,
      open_mapping = [[<C-t>]],
      start_in_insert = true,
    })
    local terminal = require('toggleterm.terminal').Terminal
    local lazygit = terminal:new({
      cmd = 'lazygit',
      dir = 'git_dir',
      direction = 'float',
      float_opts = {
        border = 'none',
      },
      start_in_insert = true,
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd('startinsert!')
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', '<leader>g', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function()
        vim.cmd('startinsert!')
      end,
    })
    function ToggleLazygit()
      lazygit:toggle()
    end
  end,
}
