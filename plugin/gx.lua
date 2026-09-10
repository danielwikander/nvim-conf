vim.g.netrw_nogx = 1

require('gx').setup({
  -- WSL: sysname reports "Linux" so gx.nvim would default to xdg-open,
  -- which isn't installed here. wslview opens links in the Windows
  -- browser and reports exit codes correctly (unlike explorer.exe).
  open_browser_app = 'wslview',
  open_browser_args = {},
  open_callback = false,
  select_prompt = true,
  handlers = {
    github = true,
    plugin = true,
    package_json = true,
    brewfile = true,
    go = true,
    search = true,
    url = true,
    commit = true,
    markdown = true,
    cve = true,
    python_pep = true,
    terraform = true,
  },
  handler_options = {
    search_engine = 'google',
    select_for_search = false,
    git_remotes = { 'upstream', 'origin' },
    git_remote_push = false,
  },
})

vim.keymap.set({ 'n', 'x' }, 'gx', '<cmd>Browse<cr>', { desc = 'Open link in browser' })
