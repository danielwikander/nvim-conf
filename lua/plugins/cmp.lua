return
{
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'VonHeikemen/lsp-zero.nvim',
        'windwp/nvim-autopairs',
    },
    config = function()
        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()
        local kind_icons = {
            Text = "",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰇽",
            Variable = "󰂡",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰅲",
        }

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        cmp.setup({
            mapping = {
                -- ['<Tab>'] = cmp_action.luasnip_supertab(),
                -- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
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
                ["<CR>"] = cmp.mapping({
                    i = function(fallback)
                        if cmp.visible() and cmp.get_active_entry() then
                            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                        else
                            fallback()
                        end
                    end,
                    s = cmp.mapping.confirm({ select = true }),
                    c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                }),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.close(),
            },
            sources = {
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
            mapping = cmp.mapping.preset.cmdline(),
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
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer', keyword_length = 3 }
            }
        })
    end,
}
