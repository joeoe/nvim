return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")

		vim.opt.termguicolors = true
		bufferline.setup()
	end,
	options = {
		hover = {
			enabled = true,
			delay = 100,
			reveal = { "close" },
		},
	},
}
