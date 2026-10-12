-- ESLint only for JS/TS (no Prettier), format on save
return {
  { "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        go = { "gofmt" },
        lua = { "stylua" },
      },
      format_on_save = { timeout_ms = 2000, lsp_format = "fallback" },
    } },

  { "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = { ensure_installed = { "eslint_d", "stylua", "ktfmt" } } },
}
