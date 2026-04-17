local function file_exists(name)
  local f = io.open(name, 'r')
  return f ~= nil and io.close(f)
end

require('neotest').setup({
  status = {
    signs = true,
  },
  adapters = {
    require('neotest-jest')({
      jestCommand = 'yarn test:coverage',
      jestConfigFile = function()
        if file_exists(vim.fn.getcwd() .. '/jest.config.js') then
          return vim.fn.getcwd() .. '/jest.config.js'
        end
        return vim.fn.getcwd() .. '/jest.config.ts'
      end,
      env = { CI = true },
      cwd = function()
        return vim.fn.getcwd()
      end,
    }),
  },
  discovery = {
    enabled = false,
  },
  icons = {
    passed = '',
    failed = '',
    running = '',
    skipped = '',
    unknown = '',
  },
  summary = {
    expand_errors = true,
    mappings = {
      expand = { 'H', 'L', '<CR>', '<2-LeftMouse>' },
      stop = { 'u', 's' },
      watch = { 'W' },
    },
  },
})

vim.keymap.set('n', '<leader>ttf', function()
  require('neotest').run.run(vim.fn.expand('%'))
end, { desc = 'Neotest run file' })

vim.keymap.set('n', '<leader>ttt', function()
  require('neotest').run.run()
end, { desc = 'Neotest run closest' })

vim.keymap.set('n', '<leader>tta', function()
  require('neotest').run.run(vim.fn.getcwd())
end, { desc = 'Neotest run all' })

vim.keymap.set('n', '<leader>tts', function()
  require('neotest').summary.toggle()
end, { desc = 'Neotest summary' })

vim.keymap.set('n', '<leader>tto', function()
  require('neotest').output_panel.open()
end, { desc = 'Neotest output' })
