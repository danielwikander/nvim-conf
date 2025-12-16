-- return {
--   'nvim-treesitter/nvim-treesitter',
--   build = ':TSUpdate',
--   branch = 'main',
--   lazy = false,
--   dependencies = {
--     {
--       'windwp/nvim-ts-autotag',
--       config = function()
--         require('nvim-ts-autotag').setup({
--           opts = {
--             enable_close = true,
--             enable_rename = true,
--             enable_close_on_slash = true,
--           },
--         })
--       end,
--     },
--   },
--   config = function()
--     local treesitter = require('nvim-treesitter.configs')
--
--     treesitter.setup({
--       ensure_installed = {
--         'c',
--         'cmake',
--         'c_sharp',
--         'css',
--         'go',
--         'html',
--         'javascript',
--         'json',
--         'lua',
--         'markdown',
--         'markdown_inline',
--         'python',
--         'scss',
--         'toml',
--         'tsx',
--         'typescript',
--         'vim',
--         'vimdoc',
--         'query',
--       },
--       highlight = {
--         enable = true,
--       },
--       indent = {
--         enable = true,
--       },
--       incremental_selection = {
--         enable = true,
--         keymaps = {
--           init_selection = nil,
--           node_incremental = 'v',
--           node_decremental = 'V',
--         },
--       },
--     })
--   end,
-- }
return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    {
      'windwp/nvim-ts-autotag',
      config = function()
        require('nvim-ts-autotag').setup({
          opts = {
            enable_close = true,
            enable_rename = true,
            enable_close_on_slash = true,
          },
        })
      end,
    },
  },
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter')

    -- Install core parsers at startup
    ts.install({
      'bash',
      'comment',
      'css',
      'diff',
      'git_config',
      'git_rebase',
      'gitcommit',
      'gitignore',
      'html',
      'javascript',
      'json',
      'latex',
      'lua',
      'luadoc',
      'make',
      'markdown',
      'markdown_inline',
      'norg',
      'python',
      'query',
      'regex',
      'scss',
      'svelte',
      'toml',
      'tsx',
      'typescript',
      'typst',
      'vim',
      'vimdoc',
      'vue',
      'xml',
    }, {
      max_jobs = 8,
    })

    local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

    local ignore_filetypes = {
      'checkhealth',
      'lazy',
      'mason',
      'snacks_dashboard',
      'snacks_notif',
      'snacks_win',
    }

    -- Auto-install parsers and enable highlighting on FileType
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      desc = 'Enable treesitter highlighting and indentation',
      callback = function(event)
        if vim.tbl_contains(ignore_filetypes, event.match) then
          return
        end

        local lang = vim.treesitter.language.get_lang(event.match) or event.match
        local buf = event.buf

        -- Start highlighting immediately (works if parser exists)
        pcall(vim.treesitter.start, buf, lang)

        -- Enable treesitter indentation
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        -- Install missing parsers (async, no-op if already installed)
        ts.install({ lang })
      end,
    })
  end,
}
