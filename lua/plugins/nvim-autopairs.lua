-- Unnecessary? Just place in cmp.lua?
--
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
return {
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup {}
    end
}
