require('copilot').setup({
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
    enabled = false,
    auto_trigger = true,
    keymap = {
      accept_and_goto = '<C-CR>',
      dismiss = false,
    },
  },
  panel = { enabled = false },
})
