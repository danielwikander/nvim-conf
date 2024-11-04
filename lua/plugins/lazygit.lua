-- vim.g.lazygit_floating_window_scaling_factor = 1

return {
  enabled = false,
  'kdheepak/lazygit.nvim',
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  keys = {
    { '<C-g>', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
  },
}
