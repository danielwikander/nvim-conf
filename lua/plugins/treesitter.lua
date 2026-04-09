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

    local languages = {
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
      'python',
      'query',
      'regex',
      'rust',
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
    }

    local isnt_installed = function(lang)
      return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
    end

    local to_install = vim.tbl_filter(isnt_installed, languages)

    if #to_install > 0 then
      ts.install(to_install, { max_jobs = 8 })
    end

    local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

    local filetypes = {}
    for _, lang in ipairs(languages) do
      for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
        table.insert(filetypes, ft)
      end
    end

    local pre_installed_parsers = {
      'c',
      'lua',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
    }

    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      callback = function(args)
        local treesitter = require('nvim-treesitter')
        local lang = vim.treesitter.language.get_lang(args.match)
        if vim.list_contains(treesitter.get_available(), lang) then
          if
            not vim.list_contains(treesitter.get_installed(), lang)
            and not vim.list_contains(pre_installed_parsers, lang)
          then
            treesitter.install(lang):wait()
          end
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          vim.treesitter.start(args.buf)
        end
      end,
      desc = 'Enable nvim-treesitter and install parser if not installed',
    })
  end,
}
