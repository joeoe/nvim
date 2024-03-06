return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  config = function()
    local ls = require 'luasnip'
    local loader = require 'luasnip.loaders.from_lua'
    local p = vim.fn.stdpath 'config' .. '/LuaSnip/'
    loader.lazy_load { paths = p }
    ls.filetype_extend('vue', { 'typescript' })

    vim.keymap.set({ 'i', 's' }, '<c-k>', function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<c-j>', function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })

    vim.keymap.set({ 'i' }, '<c-l>', function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    vim.keymap.set('n', '<leader>S', function()
      loader.load { paths = p }
      print 'Reload snippets'
    end, { desc = 'Reload snippets' })
  end,
}
