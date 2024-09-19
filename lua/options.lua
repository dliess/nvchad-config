require "nvchad.options"

-- add yours here!

vim.opt.conceallevel = 2
vim.opt.swapfile = false
vim.opt.colorcolumn = "80"
-- Set the default tab behavior in insert mode to insert 4 spaces
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3

vim.wo.relativenumber = true
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()' -- use treesitter for folding
vim.wo.foldtext = 'v:lua.vim.treesitter.foldtext()'
vim.wo.fillchars = "fold: "
vim.wo.foldlevel = 99

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
