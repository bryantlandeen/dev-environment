if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
end

vim.opt.background = "dark"
vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd("colorscheme gruvbox")