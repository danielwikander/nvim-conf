return
{
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'b0o/schemastore.nvim'
    },
    opts = {
        inlay_hints = {
            enabled = true
        }
    },
    config = function()
        local lspconfig = require('lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')

        local keymap = vim.keymap
        local opts = { noremap = true, silent = true }

        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            if client.server_capabilities.inlayHintProvider then
                vim.lsp.buf.inlay_hint(bufnr, true)
                keymap.set("n", "<leader>ch", function()
                    vim.lsp.buf.inlay_hint(0, nil)
                end, { desc = "Toggle Inlay Hints" })
            end

            -- Keybinds
            opts.desc = 'Show LSP references'
            keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts) -- show definition, references

            opts.desc = 'Go to declaration'
            keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- go to declaration

            opts.desc = 'Show LSP definitions'
            keymap.set('n', 'gD', '<cmd>Telescope lsp_definitions<CR>', opts) -- show lsp definitions

            opts.desc = 'Show LSP implementations'
            keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts) -- show lsp implementations

            opts.desc = 'Show LSP type definitions'
            keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts) -- show lsp type definitions

            opts.desc = 'Smart rename'
            keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = 'Show line diagnostics'
            keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = 'Go to previous diagnostic'
            keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = 'Go to next diagnostic'
            keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = 'Show documentation for what is under cursor'
            keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = 'Restart LSP'
            keymap.set('n', '<leader>z', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary
        end

        -- Used to enable autocompletion
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Html
        lspconfig.html.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Css
        lspconfig.cssls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Tailwind
        lspconfig.tailwindcss.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- JSON
        lspconfig.jsonls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                json = {
                    schemas = require('schemastore').json.schemas(),
                    validate = {
                        enable = true,
                    }
                }
            }
        })

        -- YAML
        lspconfig.yamlls.setup {
            settings = {
                yaml = {
                    schemaStore = {
                        -- You must disable built-in schemaStore support if you want to use
                        -- this plugin and its advanced options like `ignore`.
                        enable = false,
                        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                        url = "",
                    },
                    schemas = require('schemastore').yaml.schemas(),
                },
            },
        }

        -- Emmet
        lspconfig.emmet_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = {
                'html',
                'typescriptreact',
                'javascriptreact',
                'css',
                'sass',
                'scss',
                'less',
                'svelte',
            }
        })

        -- Lua
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    -- make the language server recognize 'vim' global
                    diagnostics = {
                        globals = { 'vim', 'MiniFiles' },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.stdpath('config') .. '/lua'] = true,
                        }
                    }
                }
            }
        })
    end
}
