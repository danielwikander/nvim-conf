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
      ts.install(languages, { max_jobs = 8 })
      require('nvim-treesitter').install(to_install)
    end

    local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

    local filetypes = {}
    for _, lang in ipairs(languages) do
      for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
        table.insert(filetypes, ft)
      end
    end

    -- Auto-install parsers and enable highlighting on FileType
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      desc = 'Enable treesitter highlighting and indentation',
      callback = function(event)
        if not vim.tbl_contains(filetypes, event.match) then
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
