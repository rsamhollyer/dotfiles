return {
  -- Mason installs servers, mason-lspconfig auto-enables them
  { "williamboman/mason.nvim", opts = {} },
  { "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig",
      "saghen/blink.cmp" },
    config = function()
      local caps = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", { capabilities = caps })
      vim.lsp.config("lua_ls", {
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "eslint", "gopls",
          "kotlin_language_server", "jsonls", "graphql" },
      })
    end },

  -- Completion
  { "saghen/blink.cmp", version = "1.*",
    opts = {
      keymap = { preset = "default" }, -- <C-y> accept, <C-n>/<C-p> select
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
    } },
}
