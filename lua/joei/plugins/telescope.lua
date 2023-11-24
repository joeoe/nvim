-- plugins/telescope.lua:
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<C-s>"] = actions.cycle_previewers_next,
						["<C-a>"] = actions.cycle_previewers_prev,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "File history" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
		vim.keymap.set("n", "<leader>fr", builtin.command_history, { desc = "Command history" })
		vim.keymap.set("n", "<leader>f/", builtin.search_history, { desc = "Search history" })
		vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Man pages" })
		vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Quickfix" })
		vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Treesitter" })
	end,
}
