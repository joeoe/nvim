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
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" },
		init = function()
			vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
			vim.o.foldcolumn = "1" -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
		end,
		config = function()
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (" 󰁂 %d "):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end

			require("ufo").setup({ fold_virt_text_handler = handler })
			-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
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
