return {
    "petertriho/nvim-scrollbar",
    config = function()
        require("scrollbar").setup {
            show_in_active_only = true,
            hide_if_all_visible = true,
            handlers = {
                cursor = false,
                gitsigns = true
            }

        }
    end
}
