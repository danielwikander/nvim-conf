return
{
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    dependencies = 'neovim/nvim-lspconfig',
    config = function()
        require('rust-tools').setup({
            tools = {
                inlay_hints = {
                    auto = false,
                }
            }
        })
    end
}
