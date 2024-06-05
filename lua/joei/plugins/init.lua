return {
  {
    enabled = false,
    'f-person/auto-dark-mode.nvim',
    lazy = false,
    priority = 9999,
    opts = {},
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        -- flavour = 'mocha',
        transparent_background = true,
        term_colors = true,
        integrations = {
          leap = true,
          mason = true,
          lsp_trouble = true,
          which_key = true,
          harpoon = true,
          neotree = true,
          notify = true,
        },
        compile_path = vim.fn.stdpath 'cache' .. '/catppuccin',
      }
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'rose-pine/neovim',
    priority = 9999,
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        -- highlight_groups = {
        --   TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
        --   TelescopeNormal = { bg = 'none' },
        --   TelescopePromptNormal = { bg = 'base' },
        --   TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
        --   TelescopeSelection = { fg = 'text', bg = 'base' },
        --   TelescopeSelectionCaret = { fg = 'rose', bg = 'rose' },
        -- },
        highlight_groups = {
          TelescopeBorder = { fg = 'overlay', bg = 'overlay' },
          TelescopeNormal = { fg = 'subtle', bg = 'overlay' },
          TelescopeSelection = { fg = 'text', bg = 'highlight_med' },
          TelescopeSelectionCaret = { fg = 'love', bg = 'highlight_med' },
          TelescopeMultiSelection = { fg = 'text', bg = 'highlight_high' },

          TelescopeTitle = { fg = 'base', bg = 'love' },
          TelescopePromptTitle = { fg = 'base', bg = 'pine' },
          TelescopePreviewTitle = { fg = 'base', bg = 'iris' },

          TelescopePromptNormal = { fg = 'text', bg = 'surface' },
          TelescopePromptBorder = { fg = 'surface', bg = 'surface' },
        },
        -- vim.cmd.colorscheme 'rose-pine',
      }
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd.colorscheme 'tokyonight'
    end,
  },

  'tpope/vim-fugitive',
  'tpope/vim-obsession',
  -- 'tpope/vim-unimpaired',
  'tpope/vim-repeat',

  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
    },
    config = true,
  },

  -- ╭─────────────────────────────╮
  -- │ Text Objects & Manipulation │
  -- ╰─────────────────────────────╯
  -- 'wellle/targets.vim',
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'ggandor/leap.nvim',
    config = function()
      local leap = require 'leap'
      leap.add_default_mappings()
    end,
  },

  'qpkorr/vim-bufkill',

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {
        check_ts = true,
      }
    end,
  },
  {
    'numToStr/Comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true,
  },

  -- ╭──────────╮
  -- │ Polyglot │
  -- ╰──────────╯
  { -- incompatible with volar 2.x
    enabled = false,
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      require('typescript-tools').setup {
        filetypes = {
          'javascript',
          'javascriptreact',
          'typescript',
          'typescriptreact',
          'vue',
        },
        settings = {
          tsserver_plugins = {
            '@vue/typescript-plugin',
            location = 'any/path',
            languages = { 'javascript', 'typescript', 'vue' },
          },
        },
      }
    end,
  },
  -- "luckasRanarison/tree-sitter-hypr",
  'elkowar/yuck.vim',
  { -- better quickfix
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
  },
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup()
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  -- {
  --   'olexsmir/gopher.nvim',
  --   ft = 'go',
  --   config = function()
  --     require('gopher').setup {
  --       goimports = true,
  --       gofmt = true,
  --       max_line_len = 120,
  --       tags = 'json',
  --       verbose = false,
  --     }
  --   end,
  --   build = function()
  --     vim.cmd 'silent! GoInstallDeps'
  --   end,
  -- },
  {
    'ellisonleao/glow.nvim',
    config = function()
      require('glow').setup {
        border = 'solid',
        width_ratio = 0.8,
        height_ratio = 0.8,
      }
    end,
    cmd = 'Glow',
  },

  -- ╭────╮
  -- │ UI │
  -- ╰────╯
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'brenoprata10/nvim-highlight-colors',
    opts = {},
  },
  {
    'luukvbaal/statuscol.nvim',
    config = function()
      local builtin = require 'statuscol.builtin'
      require('statuscol').setup {
        relculright = true,
        segments = {
          { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
          { text = { '%s' }, click = 'v:lua.ScSa' },
          { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
        },
      }
    end,
  },
  {
    'letieu/jot.lua',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  'ron-rs/ron.vim',

  {
    'knubie/vim-kitty-navigator',
    build = 'cp ./*.py ~/.config/kitty/',
    config = function()
      local km = vim.keymap
      km.set('n', '<M-Up>', '<cmd>KittyNavigateUp<cr>')
      km.set('n', '<M-Down>', '<cmd>KittyNavigateDown<cr>')
      km.set('n', '<M-Left>', '<cmd>KittyNavigateLeft<cr>')
      km.set('n', '<M-Right>', '<cmd>KittyNavigateRight<cr>')
      -- km.set('n', '<M-up>', '<cmd>KittyNavigatePrevious<cr>')
    end,
  },
  -- 'ActivityWatch/aw-watcher-vim',

  -- {
  --   'rmagatti/auto-session',
  --   config = function()
  --     require('auto-session').setup {
  --       log_level = 'error',
  --       auto_session_enabled = true,
  --       auto_session_last_session_dir = vim.fn.stdpath 'data' .. '/sessions/',
  --       auto_restore_enabled = true,
  --       auto_session_enable_last_session = true,
  --       auto_session_root_dir = vim.fn.stdpath 'data' .. '/sessions/',
  --       session_lens = {
  --         buftypes_to_ignore = {},
  --         load_on_setup = true,
  --         theme_conf = {
  --           border = true,
  --         },
  --         previewer = false,
  --       },
  --       vim.keymap.set('n', '<leader>sl', require('auto-session.session-lens').search_session, { noremap = true, silent = true }),
  --     }
  --   end,
  -- },

  -- Requires more readin:
  -- {
  -- 	"stevearc/overseer.nvim",
  -- 	config = function()
  -- 		require("overseer").setup({
  -- 			templates = { "builtin", "user.run_script", "user.cpp_build" },
  -- 		})
  -- 	end,
  -- },

  -- {
  -- 	"lukas-reineke/indent-blankline.nvim",
  -- 	opts = {}
  -- },
}
