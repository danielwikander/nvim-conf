return {
  'j-hui/fidget.nvim',
  config = function()
    require('fidget').setup({
      -- Options related to LSP progress subsystem
      progress = {
        display = {
          done_icon = '✔', -- Icon shown when all LSP progress tasks are complete
          done_style = 'FidgetCompleted', -- Highlight group for completed LSP tasks
          -- Icon shown when LSP progress tasks are in progress
          progress_icon = { pattern = 'dots', period = 1 },
          -- Highlight group for in-progress LSP tasks
          progress_style = 'FidgetProgress',
          group_style = 'Title', -- Highlight group for group name (LSP server name)
          icon_style = 'Question', -- Highlight group for group icons
          priority = 30, -- Ordering priority for LSP notification group
        },
      },
      notification = {
        -- filter = vim.log.levels.INFO, -- Minimum notifications level
        override_vim_notify = true, -- Automatically override vim.notify() with Fidget
        view = {
          stack_upwards = false, -- Display notification items from bottom to top
        },
        window = {
          winblend = 0,
          align_bottom = false, -- Whether to bottom-align the notification window
        },
      },
    })
  end,
}
