return {
  'altermo/ultimate-autopair.nvim',
  event = { 'InsertEnter' },
  branch = 'v0.6',
  opts = {
    cmap = false,
    extensions = {
      filetype = {
        nft = { 'snacks_picker_input' },
      },
    },
  },
}
