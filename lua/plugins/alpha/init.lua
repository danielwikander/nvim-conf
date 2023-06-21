return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        require "plugins.alpha.dashboard"
    end
}
