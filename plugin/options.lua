local opt = vim.opt

opt.hidden = true
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.stdpath 'data' .. '/undo'

opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevelstart = 99

opt.number = true
opt.relativenumber = true

opt.updatetime = 250
opt.timeoutlen = 400

-- fuzzy find
opt.path:append '**'

-- Command line completion "wildmenu"
opt.wildmode = 'longest:full'
opt.wildoptions = 'pum'
opt.wildignorecase = true
opt.wildignore:append '.aux,*.out,*.toc'
opt.wildignore:append '.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class'
opt.wildignore:append '.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp'
opt.wildignore:append '.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg'
opt.wildignore:append '.mp3,*.oga,*.ogg,*.wav,*.flac'
opt.wildignore:append '.eot,*.otf,*.ttf,*.woff'
opt.wildignore:append '.doc,*.pdf,*.cbr,*.cbz'
opt.wildignore:append '.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb'
opt.wildignore:append '.swp,.lock,.DS_Store,._*'
opt.pumblend = 15 -- pop up menu transparency
-- case insensitive search
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
-- Make backspace behave in a sane manner
opt.backspace = 'indent,eol,start'
-- Searching
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = 'split' -- shows results of some commands like substitute
-- Tabs
opt.shiftwidth = 2
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2

opt.autoindent = true
opt.splitright = true
opt.splitbelow = true
-- Always show signcolumn to avoid layout shift
opt.signcolumn = 'yes'

-- Highlight cursor line only in active buffer
opt.cursorline = true
local group = vim.api.nvim_create_augroup('CursorLineControl', { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline('WinLeave', false)
set_cursorline('WinEnter', true)
set_cursorline('FileType', false, 'TelescopePrompt')

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
