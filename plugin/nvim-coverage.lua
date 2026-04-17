require('coverage').setup({
  commands = true,
  signs = {
    covered   = { hl = 'CoverageCovered',   text = '█' },
    uncovered = { hl = 'CoverageUncovered', text = '█' },
  },
  summary = { min_coverage = 95.0 },
})

vim.keymap.set('n', '<leader>ttc', ':CoverageToggle<CR>', { desc = 'Toggle test coverage' })
vim.keymap.set('n', '<leader>ttC', ':CoverageSummary<CR>', { desc = 'Toggle test coverage summary' })
