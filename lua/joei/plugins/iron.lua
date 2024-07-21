return {
  'Vigemus/iron.nvim',
  config = function()
    local iron = require 'iron.core'

    iron.setup {
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        repl_definition = {
          sh = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { 'zsh' },
          },
          python = {
            command = { 'python' },
            format = require('iron.fts.common').bracketed_paste_python,
          },
        },
        -- How the repl window will be displayed
        -- See below for more information
        repl_open_cmd = require('iron.view').split.vertical.botright(60),
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to the functions in iron.core
      keymaps = {
        send_motion = '<space>is',
        visual_send = '<space>is',
        send_file = '<space>if',
        send_line = '<space>il',
        send_paragraph = '<space>ip',
        send_until_cursor = '<space>iu',
        send_mark = '<space>ic',
        mark_motion = '<space>im',
        mark_visual = '<space>im',
        remove_mark = '<space>iM',
        cr = '<space>i<cr>',
        interrupt = '<space>i<space>',
        exit = '<space>iq',
        clear = '<space>ix',
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    }
    -- iron also has a list of commands, see :h iron-commands for all available commands
    vim.keymap.set('n', '<space>ir', '<cmd>IronRepl<cr>')
    vim.keymap.set('n', '<space>iR', '<cmd>IronRestart<cr>')
    vim.keymap.set('n', '<space>iF', '<cmd>IronFocus<cr>')
    vim.keymap.set('n', '<space>ih', '<cmd>IronHide<cr>')
    vim.keymap.set('n', '<space>iw', '<cmd>IronWatch file<cr>')
    vim.keymap.set('n', '<space>iW', '<cmd>IronWatch mark<cr>')
  end,
}
