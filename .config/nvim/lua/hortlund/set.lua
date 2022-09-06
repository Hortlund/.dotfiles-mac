vim.opt.syntax = "on"
vim.opt.nu = true 
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.ma = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 2
vim.opt.confirm = true
vim.opt.autoindent = true 
vim.opt.textwidth = 100
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.relativenumber = true
--vim.o.expandtab = true

vim.cmd('filetype plugin on')

vim.cmd('set tags=./tags,tags,~/Documents/git/tags')

vim.opt.list = true
vim.opt.listchars = { tab = '>~', trail = '~', extends = '>', precedes = '<', nbsp = '%', space = '·' }

