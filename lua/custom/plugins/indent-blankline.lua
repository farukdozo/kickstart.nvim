return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl', -- required for the new v3 API
  opts = {
    scope = { enabled = true },
    indent = { char = '▏' },
  }, -- default options; customize if needed
}
