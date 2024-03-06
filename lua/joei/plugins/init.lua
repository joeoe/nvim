return {
  {
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
  'tpope/vim-unimpaired',
  'tpope/vim-repeat',

  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
      'ibhagwan/fzf-lua', -- optional
    },
    config = true,
  },

  -- TEXT OBJECTS & MANIPULATION
  'wellle/targets.vim',
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
      leap.add_repeat_mappings(';', ',')
    end,
  },

  'qpkorr/vim-bufkill',
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
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
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
  },

  -- LANGUAGE SPECIFICS
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  -- "luckasRanarison/tree-sitter-hypr",
  'elkowar/yuck.vim',
  'sindrets/diffview.nvim',
  { -- better quickfix
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
  },

  -- UI
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
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

  'rcarriga/nvim-notify',
  { 'knubie/vim-kitty-navigator', build = 'cp ./*.py ~/.config/kitty/' },

  -- Requires more readin:
  -- {
  -- 	"stevearc/overseer.nvim",
  -- 	opts = {},
  -- 	config = function()
  -- 		require("overseer").setup({
  -- 			templates = { "builtin", "user.run_script", "user.cpp_build" },
  -- 		})
  -- 	end,
  -- },

  -- {
  -- 	"lukas-reineke/indent-blankline.nvim",
  -- 	config = function()
  -- 		require("ibl").setup()
  -- 	end,
  -- },
}
