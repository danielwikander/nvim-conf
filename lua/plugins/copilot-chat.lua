return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    keys = {
      {
        '<leader>tc',
        ':CopilotChatToggle<CR>',
        mode = 'n',
        desc = 'Toggle Copilot Chat',
      },
    },
    branch = 'canary',
    cmd = { 'CopilotChat', 'CopilotChatOpen', 'CopilotChatToggle' },
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim' },
    },
    opts = {
      debug = false,
      mappings = {
        complete = {
          detail = 'Use @<Tab> or /<Tab> for options.',
          insert = '<Tab>',
        },
        close = {
          normal = 'q',
          insert = '<C-c>',
        },
        reset = {
          normal = 'R',
          insert = '',
        },
        submit_prompt = {
          normal = '<CR>',
          insert = '',
        },
        accept_diff = {
          normal = '<C-y>',
          insert = '<C-y>',
        },
        yank_diff = {
          normal = 'gy',
        },
        show_diff = {
          normal = 'gd',
        },
        show_system_prompt = {
          normal = 'gp',
        },
        show_user_selection = {
          normal = 'gs',
        },
      },
    },
  },
}
