-- TreesitterChanged hook must be before first vim.pack.add()
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      vim.cmd('TSUpdate')
    end
  end,
})

vim.pack.add({
  -- Colorscheme (loaded first via 00- prefix on this file)
  'https://github.com/rebelot/kanagawa.nvim',

  -- Core UI
  'https://github.com/folke/snacks.nvim',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/folke/noice.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/j-hui/fidget.nvim',
  'https://github.com/folke/which-key.nvim',

  -- mini.nvim modules
  'https://github.com/nvim-mini/mini.icons',
  'https://github.com/nvim-mini/mini.ai',
  'https://github.com/nvim-mini/mini.bufremove',
  'https://github.com/nvim-mini/mini.comment',
  'https://github.com/nvim-mini/mini.cursorword',
  'https://github.com/nvim-mini/mini.hipatterns',
  'https://github.com/nvim-mini/mini.surround',

  -- LSP & completion
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/williamboman/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/b0o/schemastore.nvim',
  'https://github.com/esmuellert/nvim-eslint',
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.x') },
  'https://github.com/saghen/blink.download',
  { src = 'https://github.com/saghen/blink.pairs', version = vim.version.range('*') },
  'https://github.com/rafamadriz/friendly-snippets',

  -- Treesitter
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  'https://github.com/windwp/nvim-ts-autotag',
  'https://github.com/JoosepAlviste/nvim-ts-context-commentstring',
  'https://github.com/dmmulroy/ts-error-translator.nvim',
  'https://github.com/ckolkey/ts-node-action',

  -- Git
  'https://github.com/lewis6991/gitsigns.nvim',

  -- Formatting / linting
  'https://github.com/stevearc/conform.nvim',

  -- Testing
  'https://github.com/nvim-neotest/neotest',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/nvim-neotest/neotest-jest',
  'https://github.com/antoinemadec/FixCursorHold.nvim',
  'https://github.com/andythigpen/nvim-coverage',

  -- Navigation / UI extras
  'https://github.com/christoomey/vim-tmux-navigator',
  'https://github.com/akinsho/toggleterm.nvim',
  'https://github.com/petertriho/nvim-scrollbar',
  'https://github.com/levouh/tint.nvim',
  'https://github.com/folke/trouble.nvim',
  'https://github.com/OXY2DEV/markview.nvim',
  'https://github.com/vuki656/package-info.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/chrishrb/gx.nvim',
  'https://github.com/nvim-lua/plenary.nvim',

  -- AI / Copilot
  'https://github.com/zbirenbaum/copilot.lua',
})
