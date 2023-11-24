local km = vim.keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

km.set("n", "-", vim.cmd.Ex, { desc = "Edit current directory" })

-- km.set("n", "<leader>q", "<cmd>x<cr>", { desc = ""})
km.set("n", "<leader>x", "<cmd>x<cr>", { desc = "Save -> Quit" })
km.set("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Quit all without saving" })
km.set("n", "<leader>wq", "<cmd>wq<cr>", { desc = "Write -> Quit" })
km.set("n", "<leader>ww", "<cmd>w<cr>", { desc = "Write" })
km.set("n", "<leader>/", "<cmd>noh<cr>", { desc = "Turn off highlighting" })

km.set("n", "<leader>rc", "<cmd>vsp $MYVIMRC<cr><cmd>cd %:p:h<cr>", { desc = "Vsplit vimrc" })
km.set("n", "<leader>rh", "<cmd>edit $MYVIMRC<cr><cmd>cd %:p:h<cr>", { desc = "Edit vimrc" })
km.set("n", "<leader>rr", "<cmd>so $MYVIMRC<cr>", { desc = "Reload vimrc" })
