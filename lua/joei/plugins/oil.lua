return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<C-/>'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<S-CR>'] = 'actions.select_vsplit',
        ['<C-CR>'] = 'actions.select_split',
        ['<C-t>'] = 'actions.select_tab',
        ['<C-p>'] = 'actions.preview',
        ['<C-c>'] = 'actions.close',
        -- ['<C-l>'] = 'actions.refresh',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = 'actions.tcd',
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
      },
      use_default_keymaps = false,
      show_hidden = true,
      columns = {
        'icon',
        -- 'size',
        -- 'mtime',
      },
    }
  end,
}
