return {
    "hrsh7th/nvim-cmp",
    -- version = false, -- last release is way too old
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        -- require('lsp-zero.cmp').extend()

        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()
        local kind_icons = {
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "ﴯ",
            Interface = "",
            Module = "",
            Property = "ﰠ",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = ""
        }
        cmp.setup({
            mapping = {
                ['<Tab>'] = cmp_action.luasnip_supertab(),
                ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.close(),
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'nvim_lsp_signature_help' }
            },
            window = {
                documentation = cmp.config.window.bordered({
                    border = 'single',
                    winhighlight =
                    "Normal:NormalFloat,FloatBorder:CmpDocumentationBorder,CursorLine:PmenuSel,Search:None",
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




        -- local cmp = require("cmp")
        -- return {
        --   completion = {
        --     completeopt = "menu,menuone,noinsert",
        --   },
        --   snippet = {
        --     expand = function(args)
        --       require("luasnip").lsp_expand(args.body)
        --     end,
        --   },
        --   mapping = cmp.mapping.preset.insert({
        --     ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        --     ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        --     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        --     ["<C-f>"] = cmp.mapping.scroll_docs(4),
        --     ["<C-Space>"] = cmp.mapping.complete(),
        --     ["<C-e>"] = cmp.mapping.abort(),
        --     ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --     ["<S-CR>"] = cmp.mapping.confirm({
        --       behavior = cmp.ConfirmBehavior.Replace,
        --       select = true,
        --     }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --   }),
        --   sources = cmp.config.sources({
        --     { name = "nvim_lsp" },
        --     { name = "luasnip" },
        --     { name = "buffer" },
        --     { name = "path" },
        --   }),
        --   formatting = {
        --     format = function(_, item)
        --       local icons = require("lazyvim.config").icons.kinds
        --       if icons[item.kind] then
        --         item.kind = icons[item.kind] .. item.kind
        --       end
        --       return item
        --     end,
        --   },
        --   experimental = {
        --     ghost_text = {
        --       hl_group = "LspCodeLens",
        --     },
        --   },
        -- }
    end,
}
