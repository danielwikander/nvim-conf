return
{
    'williamboman/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')

        mason.setup()

        mason_lspconfig.setup({
            ensure_installed = {
                'html',
                'cssls',
                'tailwindcss',
                'lua_ls',
                'emmet_ls',
                'jsonls',
                'rust_analyzer'
            },
            automatic_installation = true,
        })
    end
}
