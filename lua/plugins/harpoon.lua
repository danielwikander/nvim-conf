return
{
    'ThePrimeagen/harpoon',
    keys = {
        { '<leader>1', function() require('harpoon.ui').nav_file(1) end,         desc = 'Harpoon -> 1' },
        { '<leader>2', function() require('harpoon.ui').nav_file(2) end,         desc = 'Harpoon -> 2' },
        { '<leader>3', function() require('harpoon.ui').nav_file(3) end,         desc = 'Harpoon -> 3' },
        { '<leader>4', function() require('harpoon.ui').nav_file(4) end,         desc = 'Harpoon -> 4' },
        { '<leader>5', function() require('harpoon.ui').nav_file(5) end,         desc = 'Harpoon -> 5' },
        { '<leader>a', function() require('harpoon.mark').add_file() end,        desc = 'Harpoon file' },
        { '<leader>s', function() require('harpoon.ui').toggle_quick_menu() end, desc = 'Harpooned files' },
        { '<leader>S', '<cmd>Telescope harpoon marks<cr>',                       desc = 'Telescope harpooned files' },
    },
    config = function()
        require('harpoon').setup({
            menu = {
                borderchars = { '', '', '', '', '', '', '', '' },
            }
        })
    end
}
