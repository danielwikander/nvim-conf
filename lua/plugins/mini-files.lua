local show_dotfiles = false

local filter_show = function(_)
  return true
end
local filter_hide = function(fs_entry)
  return not vim.startswith(fs_entry.name, '.')
end

local toggle_dotfiles = function()
  show_dotfiles = not show_dotfiles
  New_filter = show_dotfiles and filter_show or filter_hide
  MiniFiles.refresh({
    content = {
      filter = New_filter,
    },
  })
end

return {
  'echasnovski/mini.files',
  version = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader><tab>', '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', desc = 'Open filetree' },
    { '<C-e>', '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', desc = 'Open filetree' },
  },
  config = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        vim.keymap.set('n', '<leader>th', toggle_dotfiles, { buffer = buf_id, desc = 'Toggle hidden files' })
        vim.keymap.set(
          'n',
          '<leader><tab>',
          '<cmd>lua MiniFiles.close()<CR>',
          { buffer = buf_id, desc = 'Close filetree' }
        )
        vim.keymap.set('n', '<C-e>', '<cmd>lua MiniFiles.close()<CR>', { buffer = buf_id, desc = 'Close filetree' })
        -- Reset bindings that are not relevant here (prevent misclicks)
        vim.keymap.set('n', '<CR>', '<nop>', { buffer = buf_id })
        vim.keymap.set('n', '<tab>', '<nop>', { buffer = buf_id })
        vim.keymap.set('n', '<S-tab>', '<nop>', { buffer = buf_id })
        vim.keymap.set('n', 'J', '<nop>', { buffer = buf_id })
        vim.keymap.set('n', 'K', '<nop>', { buffer = buf_id })
      end,
    })
    require('mini.files').setup({
      content = {
        filter = function(fs_entry)
          return not vim.startswith(fs_entry.name, '.')
        end,
      },
      mappings = {
        go_in = '',
        go_in_plus = 'L',
        go_out = '',
        go_out_plus = 'H',
      },
      windows = {
        max_number = 3,
        width_focus = 50,
        width_nofocus = 20,
      },
    })
  end,
}
