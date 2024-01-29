return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = "false",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
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
				compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	"tpope/vim-fugitive",
	"tpope/vim-obsession",
	"tpope/vim-unimpaired",
	"tpope/vim-repeat",
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	"qpkorr/vim-bufkill",
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- {
	-- 	"stevearc/dressing.nvim",
	-- 	event = "VeryLazy",
	-- },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
	},
	-- "luckasRanarison/tree-sitter-hypr",
	"elkowar/yuck.vim",
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup()
		end,
	},
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				relculright = true,
				segments = {
					{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
					{ text = { "%s" }, click = "v:lua.ScSa" },
					{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
				},
			})
		end,
	},

	"rcarriga/nvim-notify",
	"sindrets/diffview.nvim",

	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	},

	-- Requires more reading
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

	-- {
	-- 	"f-person/auto-dark-mode.nvim",
	-- 	config = {
	-- 		update_interval = 2000,
	-- 		set_dark_mode = function()
	-- 			vim.api.nvim_set_option("background", "dark")
	-- 			-- vim.cmd("colorscheme gruvbox")
	-- 		end,
	-- 		set_light_mode = function()
	-- 			vim.api.nvim_set_option("background", "light")
	-- 			-- vim.cmd("colorscheme gruvbox")
	-- 		end,
	-- 	},
	-- },
}
