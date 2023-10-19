local on_attach = function(client, bufnr)
    local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    if client.server_capabilities.inlayHintProvider then
        vim.lsp.buf.inlay_hint(bufnr, true)
        map("<leader>ch", function()
            vim.lsp.buf.inlay_hint(0, nil)
        end, "Toggle Inlay Hints")
    end

    -- Keybinds
    map('gd', vim.lsp.buf.declaration, 'Declaration')
    map('gD', '<cmd>Telescope lsp_definitions<CR>', 'Definitions')
    map('<leader>r', vim.lsp.buf.rename, 'Rename')
    map('<leader>e', vim.diagnostic.open_float, 'Line diagnostics')
    map('<leader>nl', ':LspRestart<CR>', 'Restart LSP')
    map("<leader><CR>", vim.lsp.buf.code_action, "Code Actions")
    map('K', vim.lsp.buf.hover, 'Hover documentation')

    local telescope_builtin = require("lazy-require").require_on_exported_call("telescope.builtin")
    map("gr", telescope_builtin.lsp_references, "References")
    map("gi", telescope_builtin.lsp_implementations, "Implementations")
end

return {
    {
        "williamboman/mason.nvim",
        cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "BufReadPre",
        dependencies = {
            "neovim/nvim-lspconfig",
            "jmederosalvarado/roslyn.nvim",
            'hrsh7th/cmp-nvim-lsp',
            'b0o/schemastore.nvim',
        },
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                vim.lsp.protocol.make_client_capabilities(),
                cmp_nvim_lsp.default_capabilities()
            )

            require("roslyn").setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            require("mason-lspconfig").setup({
                ensure_installed = {
                    'lua_ls',
                    'rust_analyzer',
                },
            })
            require("mason-lspconfig").setup_handlers({
                -- The first entry (without a key) will be the default handler
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,

                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
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

                ["rust_analyzer"] = function()
                    require("lspconfig").rust_analyzer.setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                        settings = {
                            ["rust-analyzer"] = {
                                checkOnSave = {
                                    command = "clippy",
                                    allTargets = false,
                                },
                            },
                        },
                    })
                end,

                ["jsonls"] = function()
                    require("lspconfig").jsonls.setup({
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
                end,

                ["yamlls"] = function()
                    require("lspconfig").yamlls.setup({
                        settings = {
                            yaml = {
                                schemaStore = {
                                    -- Schemastore handled separately
                                    enable = false,
                                    -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                                    url = "",
                                },
                                schemas = require('schemastore').yaml.schemas(),
                            },
                        },
                    })
                end

            })
        end,
    }
}
