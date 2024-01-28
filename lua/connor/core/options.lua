-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs and indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = -1
vim.opt.autoindent = true

-- line wrapping
vim.opt.wrap = false

--search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

--appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

--allow_backspace
vim.opt.backspace = "indent,eol,start"

-- use system clipboard
-- vim.opt.clipboard = "unnamedplus"

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- trun off swapfile
vim.opt.swapfile = false

-- turn off comment wrapping
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt.formatoptions:remove("c")
    vim.opt.formatoptions:remove("r")
    vim.opt.formatoptions:remove("o")
  end,
})

-- turn off highlighting on search
-- vim.opt.hlsearch = false
