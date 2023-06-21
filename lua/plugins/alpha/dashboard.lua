local alpha = require "alpha"

local headers = {
    ["nvim"] = {
        "                                                     ",
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    }
}

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = headers.nvim

dashboard.section.buttons.val = {
    dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", "󰄉  Recent Files", ":Telescope oldfiles<CR>"),
    dashboard.button("t", "󰷾  Find Text", ":Telescope live_grep<CR>"),
    dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
    dashboard.button("u", "  Update Plugins", ":Lazy update<CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa!<CR>"),
}

local footer = function()
    local version = "v." .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
    local lazy_ok, lazy = pcall(require, "lazy")
    if lazy_ok then
        local total_plugins = "         " .. lazy.stats().count .. " Plugins"
        local startuptime = (math.floor(lazy.stats().startuptime * 100 + 0.5) / 100)
        return version .. total_plugins .. "         " .. startuptime .. "ms"
    else
        return version
    end
end

vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
        dashboard.section.footer.val = footer()
    end,
    desc = "Footer for Alpha",
})

dashboard.opts.opts.noautocmd = false
alpha.setup(dashboard.opts)
