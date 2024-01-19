return {
	"j-morano/buffer_manager.nvim",
	config = function()
		local opts = { noremap = true }
		local km = vim.keymap.set

		require("buffer_manager").setup({
			line_keys = "1234567890",
			select_menu_item_commands = {
				edit = {
					key = "<CR>",
					command = "edit",
				},
				v = {
					key = "<C-v>",
					command = "vsplit",
				},
				h = {
					key = "<C-h>",
					command = "split",
				},
			},
			focus_alternate_buffer = false,
			short_file_names = false,
			short_term_names = false,
			loop_nav = true,
			highlight = "",
			win_extra_options = {},
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		})
		-- Navigate buffers bypassing the menu
		local bmui = require("buffer_manager.ui")
		local keys = "1234567890"
		for i = 1, #keys do
			local key = keys:sub(i, i)
			km("n", string.format("<leader>%s", key), function()
				bmui.nav_file(i)
			end, opts)
		end
		-- Just the menu
		km({ "t", "n" }, "<leader>s", bmui.toggle_quick_menu, opts)
		-- Open menu and search
		km({ "t", "n" }, "<leader>S", function()
			bmui.toggle_quick_menu()
			-- wait for the menu to open
			vim.defer_fn(function()
				vim.fn.feedkeys("/")
			end, 50)
		end, opts)
		-- Next/Prev
		-- km("n", "<M-j>", bmui.nav_next, opts)
		-- km("n", "<M-k>", bmui.nav_prev, opts)
	end,
}
