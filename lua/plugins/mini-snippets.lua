return {
  'echasnovski/mini.snippets',
  dependencies = { 'rafamadriz/friendly-snippets' },
  enabled = false,
  lazy = true,
  config = function()
    local mini_snippets = require('mini.snippets')
    -- local config_path = vim.fn.stdpath('config')

    mini_snippets.setup({
      snippets = {
        -- Load custom file with global snippets first (adjust for Windows)
        -- mini_snippets.gen_loader.from_file(config_path .. '/snippets/global.json'),

        -- Load snippets based on current language by reading files from
        -- "snippets/" subdirectories from 'runtimepath' directories.
        -- mini_snippets.gen_loader.from_lang(),
      },
    })
  end,
}
