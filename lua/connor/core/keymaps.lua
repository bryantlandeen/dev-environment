-- set leader key to space
vim.g.mapleader = " "

-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- clear search highlight
vim.keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") --split window virtically
vim.keymap.set("n", "<leader>sh", "<C-w>s") --split window horizontally
vim.keymap.set("n", "<leader>se", "<c-w>=") --split windows equal size
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>") --close current split window

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>")

-- navegate buffers
vim.keymap.set("n", "<leader>n", ":bnext<CR>")
vim.keymap.set("n", "<leader>b", ":bprevious<CR>")

-- eddit neovim config
vim.keymap.set("n", "<leader>ev", ":e ~/.config/nvim/<CR>")
