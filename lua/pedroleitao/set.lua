vim.opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"

vim.opt.ignorecase = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "+1"

vim.g.mapleader = " "
vim.opt.shell = "/bin/bash -li"
-- Status line
-- vim.o.statusline = ''
-- vim.o.statusline = vim.o.statusline .. '%{expand("%:f")}'
-- vim.o.statusline = vim.o.statusline .. ' %{get(b:,"gitsigns_status","")}'
