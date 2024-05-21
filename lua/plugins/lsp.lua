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
  map('<leader>e', vim.diagnostic.open_float, 'Line diagnostics')
  map('<leader>ul', ':LspRestart<CR>', 'Restart LSP')
  map('K', vim.lsp.buf.hover, 'Hover documentation')
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
        config = true,
      },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'nvim-lua/plenary.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'b0o/schemastore.nvim',
      'jmederosalvarado/roslyn.nvim',
      'Decodetalkers/csharpls-extended-lsp.nvim',
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      require('mason-tool-installer').setup({ ensure_installed = { 'stylua', 'prettierd', 'prettier', 'eslint' } })

      require('mason-lspconfig').setup({
        automatic_installation = true,
        ensure_installed = {
          'cssls',
          'omnisharp',
          'eslint',
          'html',
          'jsonls',
          'lua_ls',
          'marksman',
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
                  diagnostics = {
                    globals = { 'vim', 'MiniFiles' },
                  },
                  workspace = {
                    checkThirdParty = false,
                    library = {
                      [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                      [vim.fn.stdpath('config') .. '/lua'] = true,
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
              settings = {
                yaml = {
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

          ['omnisharp'] = function()
            require('lspconfig').omnisharp.setup({
              cmd = {
                'dotnet',
                '/Users/danielwikander/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll',
              },
              on_attach = on_attach,
              capabilities = capabilities,
              handlers = {
                ['textDocument/definition'] = require('csharpls_extended').handler,
              },
              enable_editorconfig_support = true,
              enable_ms_build_load_projects_on_demand = true,
              enable_roslyn_analyzers = true,
              organize_imports_on_format = true,
              enable_import_completion = true,
              sdk_include_prereleases = true,
              analyze_open_documents_only = false,
            })
          end,
        },
      })
    end,
  },
}
