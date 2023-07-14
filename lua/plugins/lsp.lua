return
{
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = true,
        config = function()
            require('lsp-zero.settings').preset({})
        end
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        keys = { ':', desc = 'Enter command mode' },
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' }, -- Optional
            { 'hrsh7th/cmp-buffer' },                  -- Optional
            { 'hrsh7th/cmp-path' },                    -- Optional
            { 'hrsh7th/cmp-cmdline' },                 -- Optional
            { 'windwp/nvim-autopairs' },
            { 'folke/neodev.nvim' },
        },
        config = function()
            require('lsp-zero.cmp').extend()

            local cmp = require('cmp')

            local kind_icons = {
                Text = '',
                Method = '󰆧',
                Function = '󰊕',
                Constructor = '',
                Field = '󰇽',
                Variable = '󰂡',
                Class = '󰠱',
                Interface = '',
                Module = '',
                Property = '󰜢',
                Unit = '',
                Value = '󰎠',
                Enum = '',
                Keyword = '󰌋',
                Snippet = '',
                Color = '󰏘',
                File = '󰈙',
                Reference = '',
                Folder = '󰉋',
                EnumMember = '',
                Constant = '󰏿',
                Struct = '',
                Event = '',
                Operator = '󰆕',
                TypeParameter = '󰅲',
            }

            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )

            local custom_mapping = {
                ['<Tab>'] = cmp.mapping(function(fallback)
                    -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
                    if cmp.visible() then
                        local entry = cmp.get_selected_entry()
                        if not entry then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        else
                            cmp.confirm()
                        end
                    else
                        fallback()
                    end
                end, { 'i', 's', 'c' }),
                ['<CR>'] = cmp.mapping({
                    i = function(fallback)
                        if cmp.visible() and cmp.get_active_entry() then
                            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                        else
                            fallback()
                        end
                    end,
                    s = cmp.mapping.confirm({ select = false }),
                    c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
                }),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.close(),

            }

            local cmdline_mapping = {
                ['<CR>'] = cmp.mapping({
                    i = function(fallback)
                        if cmp.visible() and cmp.get_active_entry() then
                            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                        else
                            fallback()
                        end
                    end,
                    s = cmp.mapping.confirm({ select = true }),
                    c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
                }),
                ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
                ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
                ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
                ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
            }

            cmp.setup({
                mapping = custom_mapping,
                sources = {
                    { name = 'path' },
                    { name = 'luasnip',                keyword_length = 2 },
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lsp_signature_help' },
                },
                window = {
                    documentation = cmp.config.window.bordered({
                        border = 'single',
                        winhighlight =
                        'Normal:NormalFloat,FloatBorder:CmpDocumentationBorder,CursorLine:PmenuSel,Search:None',
                    })
                },
                formatting = {
                    format = function(entry, vim_item)
                        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                        return vim_item
                    end
                },
            })

            cmp.setup.cmdline(':', {
                mapping = cmdline_mapping,
                sources = cmp.config.sources({
                    { name = 'path', keyword_length = 3 }
                }, {
                    {
                        name = 'cmdline',
                        keyword_length = 3,
                        option = {
                            ignore_cmds = { 'Man', '!' }
                        }
                    }
                })
            })
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmdline_mapping,
                sources = {
                    { name = 'buffer', keyword_length = 3 }
                }
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'folke/neodev.nvim' },
        },
        config = function()
            require('neodev').setup()
            local lsp = require('lsp-zero')

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
            end)

            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.setup()
        end
    }
}
