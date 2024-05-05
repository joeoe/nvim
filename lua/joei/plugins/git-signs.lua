return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local signs = require 'gitsigns'
      signs.setup {
        attach_to_untracked = true,
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 300,
          ignore_whitespace = false,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']h', function()
            vim.schedule(function()
              gs.next_hunk()
            end)
            return '<Ignore>'
          end, { expr = true, desc = 'Next hunk' })

          map('n', '[h', function()
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return '<Ignore>'
          end, { expr = true, desc = 'Previous hunk' })

          -- Actions
          map({ 'n', 'v' }, '<leader>ghs', gs.stage_hunk, { desc = 'Stage hunk' })
          map({ 'n', 'v' }, '<leader>ghr', gs.reset_hunk, { desc = 'Reset hunk' })
          map('n', '<leader>gs', gs.stage_buffer, { desc = 'Stage current buffer' })
          map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
          map('n', '<leader>gR', gs.reset_buffer, { desc = 'Reset buffer' })
          map('n', '<leader>ghp', gs.preview_hunk, { desc = 'Preview hunk' })
          map('n', '<leader>gb', function()
            gs.blame_line { full = true }
          end, { desc = 'Blame line' })
          map('n', '<leader>gd', gs.diffthis, { desc = 'Diff this' })
          map('n', '<leader>gt', gs.toggle_deleted, { desc = 'Toggle deleted' })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end,
      }
    end,
  },
}
