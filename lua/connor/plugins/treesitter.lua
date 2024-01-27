return {

  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",

  config = function ()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup {
      ensure_installed = {
          "cpp",
          "c",
          "lua",
          "python",
          "vim",
          "vimdoc",
          "gitignore",
      },
      sync_install = false,
      ignore_install = { "" }, -- List of parsers to ignore installing
      highlight = {
          enable = true, -- false will disable the whole extension
          disable = { "" }, -- list of language that will be disabled
          additional_vim_regex_highlighting = false,

      },
      indent = { enable = true, },
    }
  end

}
