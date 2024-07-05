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
      start_in_insert = false,
    })
    local terminal = require('toggleterm.terminal').Terminal
    local lazygit = terminal:new({
      cmd = 'lazygit',
      dir = 'git_dir',
      direction = 'float',
      float_opts = {
        border = 'none',
        width = vim.o.columns,
        height = vim.o.lines,
      },
      start_in_insert = true,
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd('startinsert!')
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', '<leader>g', '<cmd>close<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<esc>', '<esc>', { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function()
        vim.cmd('startinsert!')
      end,
    })
    function ToggleLazygit()
      local modified = false
      local buffer
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_option(buf, 'modified') then
          modified = true
          buffer = buf
          break
        end
      end
      if modified then
        vim.ui.select(
          { 'Yes', 'No', 'Open buffer' },
          { prompt = 'Modified buffer open, start lazygit anyway?' },
          function(choice)
            if choice == 'Yes' then
              lazygit:toggle()
            elseif choice == 'Open buffer' then
              vim.api.nvim_set_current_buf(buffer)
            end
          end
        )
      else
        lazygit:toggle()
      end
    end
  end,
}
