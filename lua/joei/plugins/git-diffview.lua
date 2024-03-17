return {
  'sindrets/diffview.nvim',
  lazy = true,
  enabled = true,
  event = 'BufRead',
  config = function()
    local lib = require 'diffview.lib'
    local diffview = require 'diffview'

    local M = {}

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Custom Ecovim toggle file history function via <leader>gd│
    -- ╰──────────────────────────────────────────────────────────╯
    M.toggle_file_history = function()
      local view = lib.get_current_view()
      if view == nil then
        diffview.file_history()
        return
      end

      if view then
        view:close()
        lib.dispose_view(view)
      end
    end

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Custom Ecovim toggle status function via <leader>gs      │
    -- ╰──────────────────────────────────────────────────────────╯
    M.toggle_status = function()
      local view = lib.get_current_view()
      if view == nil then
        diffview.open()
        return
      end

      if view then
        view:close()
        lib.dispose_view(view)
      end
    end

    return M
  end,
  -- keys = {
  --   { '<Leader>gd', "<cmd>lua require('plugins.git.diffview').toggle_file_history()<CR>", desc = 'diff file' },
  --   { '<Leader>gS', "<cmd>lua require('plugins.git.diffview').toggle_status()<CR>", desc = 'status' },
  -- },
}
