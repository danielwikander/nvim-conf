return {
  'andythigpen/nvim-coverage',
  requires = 'nvim-lua/plenary.nvim',
  keys = {
    {
      '<leader>ttc',
      ':CoverageToggle<CR>',
      mode = 'n',
      desc = 'Toggle test coverage',
    },
  },
  cmd = {
    'Coverage',
    'CoverageSummary',
    'CoverageLoad',
    'CoverageShow',
    'CoverageHide',
    'CoverageToggle',
    'CoverageClear',
  },
  config = function()
    require('coverage').setup({
      commands = true, -- create commands
      -- highlights = {
      -- customize highlight groups created by the plugin
      -- covered = { fg = '#C3E88D' }, -- supports style, fg, bg, sp (see :h highlight-gui)
      -- uncovered = { fg = '#F07178' },
      -- },
      signs = {
        covered = { hl = 'CoverageCovered', text = '█' },
        uncovered = { hl = 'CoverageUncovered', text = '█' },
      },
      summary = {
        -- customize the summary pop-up
        min_coverage = 85.0, -- minimum coverage threshold (used for highlighting)
      },
      -- lang = {
      -- customize language specific settings
      -- },
    })
  end,
}
