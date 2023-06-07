return
{
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },   -- Required
        {
            'williamboman/mason.nvim', -- Optional
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },                    -- Required
        { 'hrsh7th/cmp-nvim-lsp' },                -- Required
        { 'hrsh7th/cmp-nvim-lsp-signature-help' }, -- Optional
        { 'hrsh7th/cmp-buffer' },                  -- Optional
        { 'hrsh7th/cmp-path' },                    -- Optional
        { 'hrsh7th/cmp-cmdline' },                 -- Optional
        { 'saadparwaiz1/cmp_luasnip' },            -- Optional
        { 'hrsh7th/cmp-nvim-lua' },                -- Optional

        -- Snippets
        { 'L3MON4D3/LuaSnip' },             -- Required
        { 'rafamadriz/friendly-snippets' }, -- Optional
    },
    config = function()
        local lsp = require('lsp-zero')
        lsp.preset('recommended')
        lsp.ensure_installed({
            'html',
            'tsserver',
            'eslint',
            'lua_ls'
        })
        lsp.configure('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        })
        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()
    end
}
