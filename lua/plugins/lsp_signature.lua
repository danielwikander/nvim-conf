return {
  'ray-x/lsp_signature.nvim',
  event = 'VeryLazy',
  opts = {
    hint_inline = function()
      return false
    end,
    floating_window = true,
    hint_enable = false,
    hint_prefix = {
      above = '↙ ', -- when the hint is on the line above the current line
      current = '← ', -- when the hint is on the same line
      below = '↖ ', -- when the hint is on the line below the current line
    },
    handler_opts = {
      border = 'none',
    },
    floating_window_off_x = 0,
    max_width = 120,
  },
  config = function(_, opts)
    require('lsp_signature').setup(opts)
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- if vim.tbl_contains({ 'null-ls' }, client.name) then -- blacklist lsp
        --   return
        -- end
        require('lsp_signature').on_attach({
          -- ... setup options here ...
        }, bufnr)
      end,
    })
  end,
}
