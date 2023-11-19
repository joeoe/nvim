return {
	"tpope/vim-repeat",
	"tpope/vim-fugitive",
	"mfussenegger/nvim-dap",
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	config = function()
	-- 		require("ibl").setup()
	-- 	end,
	-- },
	{
		"f-person/auto-dark-mode.nvim",
		config = {
			update_interval = 2000,
			set_dark_mode = function()
				vim.api.nvim_set_option("background", "dark")
				-- vim.cmd("colorscheme gruvbox")
			end,
			set_light_mode = function()
				vim.api.nvim_set_option("background", "light")
				-- vim.cmd("colorscheme gruvbox")
			end,
		},
	},
}
