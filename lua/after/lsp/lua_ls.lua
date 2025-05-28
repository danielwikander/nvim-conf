return {
  settings = {
    Lua = {
      format = { enable = false },
      telemetry = { enable = false },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
          '${3rd}/luv/library',
        },
      },
    },
  },
}
