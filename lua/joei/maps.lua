local km = vim.keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

km.set('n', '-', ':Oil<cr>', { desc = 'Open parent directory' })
km.set('n', '<leader><leader>', '<c-6>', { desc = 'Switch to most recent buffer' })

-- km.set("n", "<leader>q", "<cmd>x<cr>", { desc = ""})
km.set('n', '<leader>x', '<cmd>x<cr>', { desc = 'Write -> Quit' })
km.set('n', '<leader>Q', '<cmd>qa!<cr>', { desc = 'Quit all without saving' })
km.set('n', '<leader>wq', '<cmd>wq<cr>', { desc = 'Write -> Quit' })
km.set('n', '<leader>ww', '<cmd>w<cr>', { desc = 'Write' })
km.set('n', '<leader>/', '<cmd>noh<cr>', { desc = 'Clear highlights' })
km.set('n', '<esc>', '<cmd>noh<cr>', { desc = 'Clear highlights' })

km.set('n', '<leader>rc', '<cmd>vsp $MYVIMRC<cr><cmd>lcd %:p:h<cr>', { desc = 'Vsplit vimrc' })
km.set('n', '<leader>rh', '<cmd>edit $MYVIMRC<cr><cmd>lcd %:p:h<cr>', { desc = 'Edit vimrc' })
km.set('n', '<leader>rr', '<cmd>so $MYVIMRC<cr>', { desc = 'Reload vimrc' })

km.set('n', '<leader>bo', '<cmd>%bd|e#|bd#<cr>', { desc = 'Delete ALL buffers except current one' })

km.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
km.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
km.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
km.set('n', '<leader>l', vim.diagnostic.setloclist, { desc = 'Open diagnostic [L]oclist' })

-- Add lines above or below cursor in insert mode
km.set('i', '<s-cr>', '<c-o>o')
km.set('i', '<c-cr>', '<c-o>O')

-- maybe too close to <leader>x quit
km.set('n', '<leader>X', function()
  if vim.bo.filetype == 'lua' or vim.bo.filetype == 'vim' then
    vim.cmd 'write'
    vim.cmd 'source %'
  end
end, { desc = 'Write -> execute' })

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
