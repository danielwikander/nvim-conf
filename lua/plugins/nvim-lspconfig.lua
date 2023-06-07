return {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    -- lazy = false,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'williamboman/mason-lspconfig.nvim' },
        {
            'williamboman/mason.nvim',
            run = ':MasonUpdate',
        },
        { 'j-hui/fidget.nvim' },
    },
    config = function()
        local lsp = require('lsp-zero')
        lsp.on_attach(
            function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
            end)
        lsp.setup()
    end
}
