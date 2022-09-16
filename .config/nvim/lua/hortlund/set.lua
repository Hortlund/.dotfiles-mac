vim.opt.syntax = "on"
vim.opt.nu = true 
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.ma = true
--vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.confirm = true
vim.opt.autoindent = true
--vim.opt.textwidth = 100
--vim.opt.linebreak = true
vim.opt.wrap = false
vim.opt.relativenumber = true

vim.opt.guicursor = ""
vim.opt.errorbells = false
vim.opt.updatetime = 50
vim.opt.termguicolors = true

vim.cmd('filetype plugin on')

vim.cmd('set tags=./tags,tags,~/Documents/git/tags')

--vim.opt.list = true
--vim.opt.listchars = { tab = '>~', trail = '~', extends = '>', precedes = '<', nbsp = '%', space = '·' }

