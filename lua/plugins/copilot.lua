return {
  'zbirenbaum/copilot.lua',
  enabled = true,
  cmd = 'Copilot',
  build = ':Copilot auth',
  event = 'InsertEnter',
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = '§',
        accept_word = false,
        accept_line = false,
      },
    },
    nes = {
      enabled = true, -- requires copilot-lsp as a dependency
      auto_trigger = true,
      keymap = {
        accept_and_goto = '<C-CR>',
        -- accept = '<C-g>',
        dismiss = false,
      },
    },
    panel = { enabled = false },
  },
}
