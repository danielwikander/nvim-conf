return {
  'zbirenbaum/copilot.lua',
  enabled = false,
  cmd = 'Copilot',
  build = ':Copilot auth',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup({
      panel = {
        enabled = true,
      },
      suggestion = {
        enabled = false,
      },
    })
  end,
}
