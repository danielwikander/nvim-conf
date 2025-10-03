return {
  'folke/sidekick.nvim',
  opts = {
    nes = { enabled = false },
    cli = {
      mux = {
        backend = 'tmux',
        enabled = true,
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'sidekick_terminal',
      callback = function(event)
        vim.keymap.set('t', '<esc>', '<nop>', { buffer = event.buf, noremap = true, silent = true })
      end,
    })
  end,
  keys = {
    {
      '<leader>aa',
      function()
        require('sidekick.cli').toggle({ name = 'copilot', focus = true })
      end,
      desc = 'Sidekick Toggle copilot CLI',
    },
    {
      '<leader>at',
      function()
        require('sidekick.cli').send({ msg = '{this}', name = 'copilot' })
      end,
      mode = { 'x', 'n' },
      desc = 'Send This',
    },
    {
      '<leader>av',
      function()
        require('sidekick.cli').send({ msg = '{selection}', name = 'copilot' })
      end,
      mode = { 'x' },
      desc = 'Send Visual Selection',
    },
    {
      '<leader>ap',
      function()
        require('sidekick.cli').prompt({ name = 'copilot' })
      end,
      mode = { 'n', 'x' },
      desc = 'Sidekick Select Prompt',
    },
    {
      '<c-.>',
      function()
        require('sidekick.cli').focus()
      end,
      mode = { 'n', 'x', 'i', 't' },
      desc = 'Sidekick Switch Focus',
    },
  },
}
