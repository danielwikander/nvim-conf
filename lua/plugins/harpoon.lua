return
{
    'ThePrimeagen/harpoon',
    keys = {
        { '<leader>1', function() require('harpoon.ui').nav_file(1) end,         { desc = 'Navigate to file 1' } },
        { '<leader>2', function() require('harpoon.ui').nav_file(2) end,         { desc = 'Navigate to file 2' } },
        { '<leader>3', function() require('harpoon.ui').nav_file(3) end,         { desc = 'Navigate to file 3' } },
        { '<leader>4', function() require('harpoon.ui').nav_file(4) end,         { desc = 'Navigate to file 4' } },
        { '<leader>5', function() require('harpoon.ui').nav_file(5) end,         { desc = 'Navigate to file 5' } },
        { '<leader>a', function() require('harpoon.mark').add_file() end,        { desc = 'Mark file' } },
        { '<leader>s', function() require('harpoon.ui').toggle_quick_menu() end, { desc = 'Toggle marked files menu' } },
        { '<leader>S', '<cmd>Telescope harpoon marks<cr>',                       { desc = 'Harpoon marks' } },
    },
    config = function()
        require('harpoon').setup()
    end
}
