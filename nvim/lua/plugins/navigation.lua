return {
  -- File explorer (edit the filesystem like a buffer)
  { "stevearc/oil.nvim", opts = {},
    keys = { { "-", "<cmd>Oil<CR>", desc = "File explorer" } } },

  -- Fuzzy finder
  { "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local t = require("telescope")
      t.setup({})
      pcall(t.load_extension, "fzf")
      local b = require("telescope.builtin")
      local map = vim.keymap.set
      map("n", "<leader>ff", b.find_files, { desc = "Find files" })
      map("n", "<leader>fg", b.live_grep, { desc = "Grep" })
      map("n", "<leader>fb", b.buffers, { desc = "Buffers" })
      map("n", "<leader>fh", b.help_tags, { desc = "Help" })
      map("n", "<leader>fr", b.lsp_references, { desc = "References" })
      map("n", "<leader>fs", b.lsp_document_symbols, { desc = "Symbols" })
    end },
}
