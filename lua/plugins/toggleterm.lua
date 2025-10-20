return {
  'akinsho/toggleterm.nvim',
  keys = {
    { '<C-g>', '<cmd>lua ToggleLazygit()<CR>', mode = { 'n', 't' }, desc = 'Toggle lazygit' },
  },
  config = function()
    require('toggleterm').setup({
      size = 25,
      start_in_insert = false,
      autochdir = true,
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
      persist_size = false,
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd('startinsert!')
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', '<leader>g', '<cmd>close<CR>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<esc>', '<esc>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<C-h>', '<nop>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<C-j>', '<nop>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<C-k>', '<nop>', { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<C-l>', '<nop>', { noremap = true, silent = true })
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
        -- if vim.api.nvim_buf_get_option(buf, 'modified') then
        if vim.api.nvim_get_option_value('modified', { buf = buf }) then
          modified = true
          buffer = buf
          break
        end
      end
      if modified then
        vim.ui.select(
          { 'Open buffer', 'Yes', 'No' },
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
