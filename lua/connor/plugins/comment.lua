return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    require("Comment").setup()

    local ft = require("Comment.ft")
    --ft.cpp = {'//%s', '/*%s*/'}

  end
}
