return {
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
