return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"bash",
				"c",
				"comment",
				"css",
				"diff",
				"dockerfile",
				"elixir",
				"fish",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"heex",
				"html",
				"javascript",
				"json",
				"json5",
				"jsonc",
				"latex",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"r",
				"regex",
				"rust",
				"scss",
				"sql",
				"ssh_config",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"vue",
				"xml",
				"yaml",
			},
			sync_install = false,
			highlight = {
				enable = true,
				disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 100 KB
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
					init_selection = "gnn", -- set to `false` to disable one of the mappings
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			indent = { enable = true },
		})
	end,
}
