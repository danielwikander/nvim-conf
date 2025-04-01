-- # Go to definition (in a split)
local function go_to_definition_split()
  vim.lsp.buf.definition({
    on_list = function(options)
      if #options.items > 1 then
        vim.notify('Multiple items found, opening first one', vim.log.levels.WARN)
      end

      -- Open the first item in a vertical split
      local item = options.items[1]
      local cmd = 'vsplit +' .. item.lnum .. ' ' .. item.filename .. '|' .. 'normal ' .. item.col .. '|'

      vim.cmd(cmd)
    end,
  })
end

local on_attach = function(_, bufnr)
  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- Keybinds
  map('gd', vim.lsp.buf.definition, 'Definition')
  map('<leader>d', vim.lsp.buf.definition, 'Definition')
  map('gD', go_to_definition_split, 'Definition (vsplit)')
  map('gR', vim.lsp.buf.references, 'References')
  map('<leader>D', vim.lsp.buf.type_definition, 'Type definition')
  map('<leader>r', vim.lsp.buf.rename, 'Rename')
  map('<leader>ul', ':LspRestart<CR>', 'Restart LSP')
  map('K', vim.lsp.buf.hover, 'Hover documentation')
  map('<leader><CR>', vim.lsp.buf.code_action, 'Code Action')
end

return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'williamboman/mason.nvim',
        lazy = true,
        cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUpdate' },
        opts = {
          -- registries = { 'github:Crashdummyy/mason-registry' },
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
      -- 'jmederosalvarado/roslyn.nvim',
      {
        'seblj/roslyn.nvim',
        ft = 'cs',
        opts = {
          -- your configuration comes here; leave empty for default settings
        },
      },
      'Decodetalkers/csharpls-extended-lsp.nvim',
      'yioneko/nvim-vtsls',
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

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
          -- 'roslyn',
          'graphql',
          'vtsls',
          'yamlls',
        },
        handlers = {
          -- The first entry (without a key) will be the default handler
          function(server_name) -- default handler (optional)
            require('lspconfig')[server_name].setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          end,

          ['lua_ls'] = function()
            require('lspconfig').lua_ls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
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
            })
          end,

          ['jsonls'] = function()
            require('lspconfig').jsonls.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = {
                json = {
                  schemas = require('schemastore').json.schemas(),
                  validate = {
                    enable = true,
                  },
                },
              },
            })
          end,

          ['yamlls'] = function()
            require('lspconfig').yamlls.setup({
              capabilities = capabilities,
              on_attach = on_attach(),
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
            })
          end,

          ['vtsls'] = function()
            require('lspconfig.configs').vtsls = require('vtsls').lspconfig -- set default server config, optional but recommended
            require('lspconfig').vtsls.setup({
              capabilities = capabilities,
              on_attach = on_attach,
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
            })
          end,

          ['eslint'] = function()
            require('lspconfig').eslint.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = {
                packageManager = 'yarn',
                format = false,
                organize_imports_on_format = true,
                run = 'onType',
                validate = 'on',
              },
            })
          end,

          ['graphql'] = function()
            require('lspconfig').graphql.setup({
              capabilities = capabilities,
              on_attach = on_attach,
            })
          end,
        },
      })
    end,
  },
}
