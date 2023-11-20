return {
  'j-hui/fidget.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('fidget').setup({
      progress = {
        display = {
          done_icon = '✔',
          done_style = 'FidgetCompleted',
          progress_icon = { pattern = 'dots', period = 1 },
          progress_style = 'FidgetProgress',
        },
      },
      notification = {
        override_vim_notify = true,
        view = {
          stack_upwards = false,
        },
        window = {
          winblend = 0,
          align_bottom = false,
        },
      },
    })
  end,
}
