vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.expandtab = true
vim.opt.ai = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoread = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- " make vhdl indent properly
vim.g.vhdl_indent_genportmap = 0

-- " custom keybindings
-- let NERDTreeQuitOnOpen=1

vim.opt.splitbelow = true
vim.opt.splitright = true

-- " error sounds
-- vim.opt.belloff = all
-- vim.opt.visualbell = true

vim.opt.showmode = false
vim.opt.signcolumn = "yes"
-- vim.opt.completeopt = { "menuone" , "noselect", "noinsert" }

vim.opt.hlsearch = false

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
