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
          virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
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
          map('n', ']c', function()
            if vim.wo.diff then
              return ']c'
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then
              return '[c'
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          map({ 'n', 'v' }, '<leader>ghs', gs.stage_hunk)
          map({ 'n', 'v' }, '<leader>ghr', gs.reset_hunk)
          map('n', '<leader>ghS', gs.stage_buffer)
          map('n', '<leader>ghu', gs.undo_stage_hunk)
          map('n', '<leader>ghR', gs.reset_buffer)
          map('n', '<leader>ghp', gs.preview_hunk)
          map('n', '<leader>gm', function()
            gs.blame_line { full = true }
          end)
          map('n', '<leader>ghd', gs.diffthis)
          map('n', '<leader>ght', gs.toggle_deleted)

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end,
      }
    end,
  },
}
