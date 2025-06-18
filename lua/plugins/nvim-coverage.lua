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
    {
      '<leader>ttC',
      ':CoverageSummary<CR>',
      mode = 'n',
      desc = 'Toggle test coverage summary',
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
      -- covered = { fg = '#C3E88D' }, -- supports style, fg, bg, sp (see :h highlight-gui)
      -- uncovered = { fg = '#F07178' },
      -- },
      signs = {
        covered = { hl = 'CoverageCovered', text = '█' },
        uncovered = { hl = 'CoverageUncovered', text = '█' },
      },
      summary = {
        min_coverage = 95.0, -- minimum coverage threshold (used for highlighting)
      },
    })
  end,
}
