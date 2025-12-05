return {
  'dmmulroy/ts-error-translator.nvim',
  opts = {
    auto_attach = true,
    servers = {
      'astro',
      'svelte',
      'ts_ls',
      'tsserver', -- deprecated, use ts_ls
      'typescript-tools',
      'volar',
      'vtsls',
      'tsgo',
    },
  },
}
