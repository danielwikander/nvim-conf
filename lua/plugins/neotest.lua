local function file_exists(name)
  local f = io.open(name, 'r')
  return f ~= nil and io.close(f)
end

return {
  'nvim-neotest/neotest',
  cmd = 'Neotest',
  commit = '1d4b3bd89afa8bfa12fffd2bb1ccd26ac3c92ce5',
  keys = {
    {
      '<leader>ttf',
      function()
        require('neotest').run.run(vim.fn.expand('%'))
      end,
      desc = 'Neotest run file',
    },
    {
      '<leader>ttt',
      function()
        require('neotest').run.run()
      end,
      desc = 'Neotest run closest',
    },
    {
      '<leader>tta',
      function()
        require('neotest').run.run(vim.fn.getcwd())
      end,
      desc = 'Neotest run all',
    },
    {
      '<leader>tts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'Neotest summary',
    },
    {
      '<leader>tto',
      function()
        require('neotest').output_panel.open()
      end,
      desc = 'Neotest output',
    },
  },
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-jest',
  },
  config = function()
    require('neotest').setup({
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
  end,
}
