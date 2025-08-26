return {
  "williamboman/mason.nvim",
  tag = "v1.11.0",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      tag = "v1.32.0"
    }
  },

  config = function()

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",
        "clangd",
        "lua_ls",
        "cmake",
        "bashls",
        "vhdl_ls",
        "rust_analyzer",
      }
    })

  end
}
