--? Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--? Editor behavior
vim.opt.backspace = {"indent", "eol", "start"}
vim.opt.showcmd = true
vim.opt.laststatus = 3
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.cursorline = true
vim.opt.number = true

--? Tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

--? Keymap
vim.keymap.set('n', '<leader>h', vim.cmd.nohlsearch)

print("Setting loaded!")
