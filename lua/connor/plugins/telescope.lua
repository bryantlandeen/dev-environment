return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })
    -- print(require("nvim-tree.core").get_cwd())

    local get_cwd = function()
      local cwd = require("nvim-tree.core").get_cwd()
      if cwd == nil then
        return vim.fn.getcwd()
      end
      return cwd
    end

    -- set keymaps
    local builtin = require('telescope.builtin')
    vim.keymap.set("n", "<leader>ff", function() builtin.find_files({cwd = get_cwd()}) end, { desc = "Fuzzy find files in nvim-tree cwd" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
    vim.keymap.set("n", "<leader>fs", function() builtin.live_grep({cwd = get_cwd()}) end, { desc = "Find string in cwd" })
    vim.keymap.set("n", "<leader>fc", function() builtin.grep_string({cwd = get_cwd()}) end, { desc = "Find string under cursor in cwd" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find current buffers" })

  end
}
