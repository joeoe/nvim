return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local status, bufferline = pcall(require, "bufferline")
		if not status then
			return
		end

		vim.opt.termguicolors = true
		bufferline.setup()
	end,
}
