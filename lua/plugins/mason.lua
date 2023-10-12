return
{
    'williamboman/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup({
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
