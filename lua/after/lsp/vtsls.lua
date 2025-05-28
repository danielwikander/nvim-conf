return {
  settings = {
    vtsls = {
      experimental = {
        completion = {
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      },
    },
    typescript = {
      updateImportsOnFileMove = { enabled = 'always' },
      preferences = {
        importModuleSpecifier = 'relative',
      },
      suggest = {
        completeFunctionCalls = true,
      },
      inlayHints = {
        enumMemberValues = { enabled = true },
      },
    },
  },
}
