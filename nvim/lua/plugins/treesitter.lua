return {
  { "nvim-treesitter/nvim-treesitter", branch = "master", build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "kotlin", "java", "go",
          "typescript", "tsx", "javascript", "json", "yaml", "graphql",
          "python", "bash", "markdown", "sql", "dockerfile" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end },
}
