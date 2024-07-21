local km = vim.keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

km.set('n', '-', ':Oil<cr>', { desc = 'Open parent directory' })
-- km.set('n', '<leader><leader>', '<c-6>', { desc = 'Switch to most recent buffer' })

km.set('n', 'J', 'mzJ`z')
km.set('n', '<C-d>', '<C-d>zz')
km.set('n', '<C-u>', '<C-u>zz')
km.set('n', 'n', 'nzzzv')
km.set('n', 'N', 'Nzzzv')
km.set('x', '<leader>p', [["_dP]], { desc = 'Replace selection and keep yanked text' })
km.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
km.set('n', '<leader>Y', [["+Y]], { desc = 'Yank current line to system clipboard' })
-- km.set({ 'n', 'v' }, '<leader>d', [["_d]])

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
km.set('n', '<leader>em', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
km.set('n', '<leader>dL', vim.diagnostic.setloclist, { desc = 'Open diagnostic [L]oclist' })

-- Add lines above or below cursor in insert mode
km.set('i', '<s-cr>', '<c-o>o')
km.set('i', '<c-cr>', '<c-o>O')

-- maybe too close to <leader>x quit
km.set('n', '<leader>so', function()
  if vim.bo.filetype == 'lua' or vim.bo.filetype == 'vim' then
    vim.cmd 'write'
    vim.cmd 'source %'
  end
end, { desc = 'Write -> execute' })

-- Terminal
km.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

km.set('n', '<leader>gg', ':Neogit kind=auto<cr>', { desc = 'Neogit in Split' })
km.set('n', '<leader>G', ':Neogit kind=tab<cr>', { desc = 'Neogit in float' })

km.set('n', '<leader>j', function()
  require('jot').toggle()
end, { desc = 'Open Jot split', noremap = true, silent = true })

km.set('v', 'J', ":m '>+1<CR>gv=gv")
km.set('v', 'K', ":m '>-2<CR>gv=gv")

vim.keymap.set('n', '<leader>sw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word under cursor' })
vim.keymap.set('n', '<leader>mx', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make current file executable' })
