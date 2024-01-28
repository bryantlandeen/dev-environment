return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  -- enabled = false,

  config = function()
    require("bufferline").setup({
      options = {
        separator_style = "slant",
        -- numbers = "buffer_id",
        offsets = {
          {
            filetype = "NvimTree",
            text = "Nvim Tree",
            highlight = "Directory",
            separator = true,
          }
        }
      }

    })

    -- navegate buffers
    vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", {desc = "go to buffer 1", silent = true})
    vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", {desc = "go to buffer 2", silent = true})
    vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", {desc = "go to buffer 3", silent = true})
    vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", {desc = "go to buffer 4", silent = true})
    vim.keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", {desc = "go to buffer 5", silent = true})
    vim.keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", {desc = "go to buffer 6", silent = true})
    vim.keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", {desc = "go to buffer 7", silent = true})
    vim.keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", {desc = "go to buffer 8", silent = true})
    vim.keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", {desc = "go to buffer 9", silent = true})
    vim.keymap.set("n", "<leader>0", "<cmd>BufferLineGoToBuffer 0<CR>", {desc = "go to last buffer", silent = true})

    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", {desc = "go to next buffer", silent = true})
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", {desc = "go to prev buffer", silent = true})

    -- delete current buffer
    vim.keymap.set("n", "<leader>bd", ":bd<CR>")

  end,
}
