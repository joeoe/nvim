return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      local ai = require 'mini.ai'
      local spec_treesitter = ai.gen_spec.treesitter
      ai.setup {
        n_lines = 500,
        custom_textobjects = {
          f = spec_treesitter({
            a = '@function.outer',
            i = '@function.inner',
          }, {}),
        },
      }
      require('mini.bufremove').setup()
      require('mini.bracketed').setup {
        undo = { suffix = '' },
        window = { suffix = '' },
        jump = { suffix = '' },
        indent = { suffix = '' },
      }
    end,
  },
}
