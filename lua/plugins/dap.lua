return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'mxsdev/nvim-dap-vscode-js',
    'theHamsta/nvim-dap-virtual-text',
    {
      'microsoft/vscode-js-debug',
      version = '1.x',
      build = 'npm i && npm run compile vsDebugServerBundle && mv dist out',
    },
  },
  keys = {
    {
      '<F1>',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Toggle breakpoint',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Step over',
    },
    {
      '<F3>',
      function()
        require('dap').step_into()
      end,
      desc = 'Step into',
    },
    {
      '<F4>',
      function()
        require('dap').step_out()
      end,
      desc = 'Step out',
    },
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Continue',
    },
  },
  config = function()
    require('nvim-dap-virtual-text').setup()
    require('dap-vscode-js').setup({
      debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug',
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' },
    })

    for _, language in ipairs({ 'typescript', 'javascript', 'svelte', 'typescriptreact', 'javascriptreact' }) do
      require('dap').configurations[language] = {
        {
          type = 'pwa-node',
          request = 'attach',
          processId = require('dap.utils').pick_process,
          name = 'Attach debugger to existing `node --inspect` process',
          sourceMaps = true,
          resolveSourceMapLocations = {
            '${workspaceFolder}/**',
            '!**/node_modules/**',
          },
          cwd = '${workspaceFolder}/src',
          skipFiles = { '${workspaceFolder}/node_modules/**/*.js' },
          runtimeExecutable = 'npx',
          runtimeArgs = { 'tsx' },
        },
        {
          type = 'pwa-chrome',
          name = 'Launch Chrome to debug client',
          request = 'launch',
          url = 'http://localhost:5173',
          sourceMaps = true,
          protocol = 'inspector',
          port = 9222,
          webRoot = '${workspaceFolder}/src',
          skipFiles = { '**/node_modules/**/*', '**/@vite/*', '**/src/client/*', '**/src/*' },
          runtimeExecutable = 'npx',
          runtimeArgs = { 'tsx' },
        },
      }
    end

    require('dapui').setup()
    local dap, dapui = require('dap'), require('dapui')
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open({ reset = true })
    end
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end,
}
