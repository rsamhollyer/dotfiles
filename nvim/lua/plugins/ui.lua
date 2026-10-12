return {
  -- Colorscheme
  { "folke/tokyonight.nvim", priority = 1000,
    config = function() vim.cmd.colorscheme("tokyonight-night") end },

  -- Keymap hints
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },

  -- Statusline
  { "nvim-lualine/lualine.nvim", opts = { options = { theme = "tokyonight" } } },

  -- Indent guides
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
}
