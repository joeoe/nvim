return {
  'L3MON4D3/LuaSnip',
  build = 'make install_jsregexp',
  config = function()
    local ls = require 'luasnip'
    local types = require 'luasnip.util.types'

    ls.config.set_config {
      -- This tells LuaSnip to remember to keep around the last snippet.
      -- You can jump back into it even if you move outside of the selection
      history = false,

      -- This one is cool cause if you have dynamic snippets, it updates as you type!
      updateevents = 'TextChanged,TextChangedI',

      -- Autosnippets:
      enable_autosnippets = true,

      -- Crazy highlights!!
      -- #vid3
      -- ext_opts = nil,
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { ' « ', 'NonTest' } },
          },
        },
      },
    }

    -- for _, ft_path in ipairs(vim.api.nvim_get_runtime_file('lua/joei/snip/ft/*.lua', true)) do
    --   loadfile(ft_path)()
    -- end

    ls.filetype_extend('vue', { 'typescript' })
    require('luasnip.loaders.from_lua').lazy_load { paths = { './snippets' } }

    vim.keymap.set('n', '<leader>sr', function()
      require('luasnip.loaders.from_lua').load { paths = { './snippets' } }
      print 'Reload snippets'
    end, { desc = 'Reload snippets' })

    vim.keymap.set('n', '<leader>se', function()
      require('luasnip.loaders').edit_snippet_files()
    end, { desc = 'Edit snippets' })
  end,
}
