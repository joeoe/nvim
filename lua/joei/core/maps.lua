vim.g.mapleader = " "

--vim.keymap.set("n", "-", vim.cmd.Ex)

vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<cr>")
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>")
vim.keymap.set("n", "<leader>ww", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>/", "<cmd>noh<cr>")

vim.keymap.set("n", "<leader>rc", "<cmd>edit $MYVIMRC<cr><cmd>cd %:p:h<cr><cmd>Neotree reveal<cr>")
vim.keymap.set("n", "<leader>rr", "<cmd>so $MYVIMRC<cr>")
