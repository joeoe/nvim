-- plugins/telescope.lua:
return {
  'nvim-telescope/telescope.nvim',
  -- branch = "0.1.x",
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    local Layout = require 'nui.layout'
    local Popup = require 'nui.popup'
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'
    local actions = require 'telescope.actions'
    local TSLayout = require 'telescope.pickers.layout'
    local lga_actions = require 'telescope-live-grep-args.actions'

    telescope.load_extension 'fzf'
    telescope.load_extension 'ui-select'

    vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = '[T]elescope [F]iles' })
    vim.keymap.set('n', '<leader>to', builtin.oldfiles, { desc = '[T]elescope File history' })
    vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = '[T]elescope [G]rep' })
    vim.keymap.set('n', '<leader>ta', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
    vim.keymap.set('n', '<leader>tG', function()
      builtin.live_grep { search_dirs = { '%:p:h' } }
    end, { desc = 'Grep in current directory' })
    vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = '[T]elescope [B]uffers' })
    vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = '[T]elescope [H]elp tags' })
    vim.keymap.set('n', '<leader>tr', builtin.command_history, { desc = '[T]elescope Command history' })
    vim.keymap.set('n', '<leader>t/', builtin.search_history, { desc = '[T]elescope Search history' })
    vim.keymap.set('n', '<leader>tm', builtin.man_pages, { desc = '[T]elescope [M]an pages' })
    vim.keymap.set('n', '<leader>tq', builtin.quickfix, { desc = '[T]elescope [Q]uickfix' })
    vim.keymap.set('n', '<leader>tt', builtin.treesitter, { desc = '[T]elescope [T]reesitter' })
    vim.keymap.set('n', '<leader>tp', builtin.pickers, { desc = '[T]elescope [P]ickers' })
    vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = '[T]elescope [K]eymaps' })
    vim.keymap.set('n', '<leader>td', builtin.diagnostics, { desc = '[T]elescope [D]iagnostics' })
    -- vim.keymap.set('n', '<leader>ts', builtin.treesitter, { desc = '[T]elescope [S]elect telescope' })
    -- vim.keymap.set('n', '<leader>tw', builtin.treesitter, { desc = '[T]elescope Grep [W]ord under cursor' })
    vim.keymap.set('n', '<leader>t.', builtin.resume, { desc = '[T]elescope Resume' })
    vim.keymap.set('n', '<leader>:', builtin.commands, { desc = '[T]elescope Commands' })

    -- local function make_popup(options)
    --   local popup = Popup(options)
    --   function popup.border:change_title(title)
    --     popup.border.set_text(popup.border, 'top', title)
    --   end
    --   return TSLayout.Window(popup)
    -- end

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            -- Skip normal mode in telescope
            -- ['<esc>'] = actions.close,
            -- ['<C-j>'] = actions.move_selection_next,
            -- ['<C-k>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            ['<C-s>'] = actions.cycle_previewers_next,
            ['<C-a>'] = actions.cycle_previewers_prev,
            ['<C-Down>'] = actions.cycle_history_next,
            ['<C-Up>'] = actions.cycle_history_prev,
          },
          n = {
            ['<C-s>'] = actions.cycle_previewers_next,
            ['<C-a>'] = actions.cycle_previewers_prev,
          },
        },

        layout_strategy = 'flex',
        -- layout_config = {
        --   horizontal = {
        --     size = {
        --       width = '90%',
        --       height = '60%',
        --     },
        --   },
        --   vertical = {
        --     size = {
        --       width = '90%',
        --       height = '90%',
        --     },
        --   },
        -- },

        -- create_layout = function(picker)
        -- local border = {
        --   results = {
        --     top_left = '┌',
        --     top = '─',
        --     top_right = '┬',
        --     right = '│',
        --     bottom_right = '',
        --     bottom = '',
        --     bottom_left = '',
        --     left = '│',
        --   },
        --   results_patch = {
        --     minimal = {
        --       top_left = '┌',
        --       top_right = '┐',
        --     },
        --     horizontal = {
        --       top_left = '┌',
        --       top_right = '┬',
        --     },
        --     vertical = {
        --       top_left = '├',
        --       top_right = '┤',
        --     },
        --   },
        --   prompt = {
        --     top_left = '├',
        --     top = '─',
        --     top_right = '┤',
        --     right = '│',
        --     bottom_right = '┘',
        --     bottom = '─',
        --     bottom_left = '└',
        --     left = '│',
        --   },
        --   prompt_patch = {
        --     minimal = {
        --       bottom_right = '┘',
        --     },
        --     horizontal = {
        --       bottom_right = '┴',
        --     },
        --     vertical = {
        --       bottom_right = '┘',
        --     },
        --   },
        --   preview = {
        --     top_left = '┌',
        --     top = '─',
        --     top_right = '┐',
        --     right = '│',
        --     bottom_right = '┘',
        --     bottom = '─',
        --     bottom_left = '└',
        --     left = '│',
        --   },
        --   preview_patch = {
        --     minimal = {},
        --     horizontal = {
        --       bottom = '─',
        --       bottom_left = '',
        --       bottom_right = '┘',
        --       left = '',
        --       top_left = '',
        --     },
        --     vertical = {
        --       bottom = '',
        --       bottom_left = '',
        --       bottom_right = '',
        --       left = '│',
        --       top_left = '┌',
        --     },
        --   },
        -- }
        --
        -- local results = make_popup {
        --   focusable = false,
        --   border = {
        --     style = border.results,
        --     text = {
        --       top = picker.results_title,
        --       top_align = 'center',
        --     },
        --   },
        --   win_options = {
        --     winhighlight = 'Normal:Normal',
        --   },
        -- }
        --
        -- local prompt = make_popup {
        --   enter = true,
        --   border = {
        --     style = border.prompt,
        --     text = {
        --       top = picker.prompt_title,
        --       top_align = 'center',
        --     },
        --   },
        --   win_options = {
        --     winhighlight = 'Normal:Normal',
        --   },
        -- }
        --
        -- local preview = make_popup {
        --   focusable = false,
        --   border = {
        --     style = border.preview,
        --     text = {
        --       top = picker.preview_title,
        --       top_align = 'center',
        --     },
        --   },
        -- }
        --
        -- local box_by_kind = {
        --   vertical = Layout.Box({
        --     Layout.Box(preview, { grow = 1 }),
        --     Layout.Box(results, { grow = 1 }),
        --     Layout.Box(prompt, { size = 3 }),
        --   }, { dir = 'col' }),
        --   horizontal = Layout.Box({
        --     Layout.Box({
        --       Layout.Box(results, { grow = 1 }),
        --       Layout.Box(prompt, { size = 3 }),
        --     }, { dir = 'col', size = '50%' }),
        --     Layout.Box(preview, { size = '50%' }),
        --   }, { dir = 'row' }),
        --   minimal = Layout.Box({
        --     Layout.Box(results, { grow = 1 }),
        --     Layout.Box(prompt, { size = 3 }),
        --   }, { dir = 'col' }),
        -- }
        --
        -- local function get_box()
        --   local strategy = picker.layout_strategy
        --   if strategy == 'vertical' or strategy == 'horizontal' then
        --     return box_by_kind[strategy], strategy
        --   end
        --
        --   local height, width = vim.o.lines, vim.o.columns
        --   local box_kind = 'horizontal'
        --   if width < 100 then
        --     box_kind = 'vertical'
        --     if height < 40 then
        --       box_kind = 'minimal'
        --     end
        --   end
        --   return box_by_kind[box_kind], box_kind
        -- end
        --
        -- local function prepare_layout_parts(layout, box_type)
        --   layout.results = results
        --   results.border:set_style(border.results_patch[box_type])
        --
        --   layout.prompt = prompt
        --   prompt.border:set_style(border.prompt_patch[box_type])
        --
        --   if box_type == 'minimal' then
        --     layout.preview = nil
        --   else
        --     layout.preview = preview
        --     preview.border:set_style(border.preview_patch[box_type])
        --   end
        -- end
        --
        -- local function get_layout_size(box_kind)
        --   return picker.layout_config[box_kind == 'minimal' and 'vertical' or box_kind].size
        -- end
        --
        -- local box, box_kind = get_box()
        -- local layout = Layout({
        --   relative = 'editor',
        --   position = '50%',
        --   size = get_layout_size(box_kind),
        -- }, box)
        --
        -- layout.picker = picker
        -- prepare_layout_parts(layout, box_kind)
        --
        -- local layout_update = layout.update
        -- function layout:update()
        --   local box, box_kind = get_box()
        --   prepare_layout_parts(layout, box_kind)
        --   layout_update(self, { size = get_layout_size(box_kind) }, box)
        -- end
        --
        -- return TSLayout(layout)
        -- end,
      },
      extensions = {
        --   ['ui-select'] = {
        --     require('telescope.themes').get_dropdown(),
        --   },
        live_grep_args = {
          mappings = { -- extend mappings
            i = {
              ['<C-k>'] = lga_actions.quote_prompt(),
              ['<C-i>'] = lga_actions.quote_prompt { postfix = ' --iglob ' },
              -- freeze the current list and start a fuzzy search in the frozen list
              ['<C-space>'] = actions.to_fuzzy_refine,
            },
          },
        },
      },
    }
  end,
}
