return {
  enabled = true,
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require 'bufferline'

    vim.opt.termguicolors = true
    bufferline.setup {
      options = {
        -- style_preset = bufferline.style_preset.minimal,
        -- separator_style = "slope",
        -- indicator = {
        -- 	style = "underline",
        -- },
        hover = {
          enabled = true,
          delay = 100,
          reveal = { 'close' },
        },
      },
      highlights = require('catppuccin.groups.integrations.bufferline').get(),
    }
  end,
}
