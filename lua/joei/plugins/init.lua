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
        flavour = 'mocha',
        transparent_background = false,
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
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
  { 'rose-pine/neovim', name = 'rose-pine' },

  'tpope/vim-fugitive',
  'tpope/vim-obsession',
  -- 'tpope/vim-unimpaired',
  'tpope/vim-repeat',

  {
    'NeogitOrg/neogit',
    branch = 'nightly',
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
    opts = {}, -- this is equalent to setup({}) function
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
  'ActivityWatch/aw-watcher-vim',

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
