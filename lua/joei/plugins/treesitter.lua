return {
  {
    enabled = true,
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      {
        -- enabled = false,
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
    },
    config = function()
      local configs = require 'nvim-treesitter.configs'
      configs.setup {
        ensure_installed = {
          'bash',
          'c',
          'comment',
          'css',
          'csv',
          'diff',
          'dockerfile',
          'elixir',
          'fish',
          'git_config',
          'git_rebase',
          'gitattributes',
          'gitcommit',
          'gitignore',
          'go',
          'html',
          'http',
          'ini',
          'javascript',
          'jq',
          'jsdoc',
          'json',
          'json5',
          'jsonc',
          'latex',
          'lua',
          'make',
          'markdown',
          'markdown_inline',
          'nix',
          'python',
          'query',
          'query',
          'r',
          'rasi',
          'regex',
          'ruby',
          'rust',
          'scss',
          'sql',
          'ssh_config',
          'toml',
          'tsx',
          'typescript',
          'udev',
          'vim',
          'vimdoc',
          -- 'vue',
          'xml',
          'yaml',
        },
        sync_install = false,
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max_filesize = 1000 * 1024 -- 1000 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'gnn', -- set to `false` to disable one of the mappings
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
          },
        },
        indent = { enable = true },
        textobjects = {
          select = {
            enable = false,
          },
        },
      }

      -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      -- parser_config.hypr = {
      -- 	install_info = {
      -- 		url = "https://github.com/luckasRanarison/tree-sitter-hypr",
      -- 		files = { "src/parser.c" },
      -- 		branch = "master",
      -- 	},
      -- 	filetype = "hypr",
      -- }
    end,
  },
}
