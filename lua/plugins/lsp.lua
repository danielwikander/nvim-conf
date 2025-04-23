return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  enabled = true,
  dependencies = {
    {
      'williamboman/mason.nvim',
      lazy = true,
      cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUpdate' },
      keys = {
        {
          '<leader>M',
          '<cmd>Mason<CR>',
          desc = 'Mason',
        },
      },
      opts = {
        ui = {
          icons = {
            package_installed = '●',
            package_uninstalled = '○',
            package_pending = '➜',
          },
        },
      },
    },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'nvim-lua/plenary.nvim',
    'saghen/blink.cmp',
    'b0o/schemastore.nvim',
    'yioneko/nvim-vtsls',
    'esmuellert/nvim-eslint',
  },
  config = function()
    require('nvim-eslint').setup({})

    local servers = {
      eslint = {
        settings = {
          packageManager = 'yarn',
          format = false,
          organize_imports_on_format = true,
          run = 'onType',
          validate = 'on',
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            format = { enable = false },
            telemetry = { enable = false },
            diagnostics = { globals = { 'vim' } },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
                '${3rd}/luv/library',
              },
            },
          },
        },
      },
      yamlls = {
        settings = {
          yaml = {
            format = {
              enable = true,
            },
            schemaStore = {
              -- Schemastore handled separately
              enable = false,
              -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
              url = '',
            },
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      },
      jsonls = {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = {
              enable = true,
            },
          },
        },
      },
      vtsls = {
        settings = {
          vtsls = {
            experimental = {
              completion = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = 'always' },
            preferences = {
              importModuleSpecifier = 'relative',
            },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
            },
          },
        },
      },
      graphql = {},
    }

    require('mason-tool-installer').setup({
      ensure_installed = {
        'eslint',
        'jsonls',
        'prettier',
        'prettierd',
        'stylua',
        'vtsls',
        'yamlls',
      },
    })

    require('mason-lspconfig').setup({
      automatic_installation = true,
      ensure_installed = {
        'cssls',
        'eslint',
        'html',
        'jsonls',
        'lua_ls',
        'graphql',
        'vtsls',
        'yamlls',
      },
    })

    for server, settings in pairs(servers) do
      vim.lsp.config(server, settings)
      vim.lsp.enable(server)
    end
  end,
}
