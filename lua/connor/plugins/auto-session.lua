return {
  "rmagatti/auto-session",

  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      log_level = "error",
      -- auto_session_enable_last_session = false,
      -- auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
      -- auto_session_enabled = true,
      auto_session_create_enabled = false,
      -- auto_save_enabled = nil,
      auto_restore_enabled = nil,
      auto_session_suppress_dirs = { "~/", "~/projects", "~/Documents", "~/downloads"},
      -- auto_session_use_git_branch = nil,
      -- bypass_session_save_file_types = nil
    })

    vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for current cwd" })
    vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })

    -- vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

  end,

}
