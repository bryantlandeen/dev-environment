local Remap = require("connor.keymaps")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
-- local 
-- -- nmap(";",":")

-- -- nerdtree settings
-- nmap("<C-n>", ":NERDTreeToggle<CR>")
-- nnoremap("<C-n>", ":NERDTreeToggle<CR>")

vim.g.mapleader = " "

-- -- window moving mapping
nnoremap("<C-j>", "<C-W>j")
nnoremap("<C-k>", "<C-W>k")
nnoremap("<C-l>", "<C-W>l")
nnoremap("<C-h>", "<C-W>h")

-- split windows
nnoremap("<leader>v", ":vsplit<CR>")
nnoremap("<leader>h", ":split<CR>")

-- navegate buffers
nnoremap("<leader>n", ":bnext<CR>")
nnoremap("<leader>b", ":bprevious<CR>")

-- Resize with arrows
nnoremap("<C-Up>", ":resize -2<CR>")
nnoremap("<C-Down>", ":resize +2<CR>")
nnoremap("<C-Left>", ":vertical resize +2<CR>")
nnoremap("<C-Right>", ":vertical resize -2<CR>")


--telescope remaps
nnoremap("<leader>ff", function() require('telescope.builtin').find_files() end )
nnoremap("<leader>fg", function() require('telescope.builtin').live_grep() end )
nnoremap("<leader>fb", function() require('telescope.builtin').buffers() end )
nnoremap("<leader>fh", function() require('telescope.builtin').help_tags() end )
nnoremap("<leader>fr", function() require('telescope.builtin').git_files() end )

nnoremap("<leader>ev", ":e ~/.config/nvim/<CR>")

