return {
	-- File explorer (edit the filesystem like a buffer)
	{ "stevearc/oil.nvim", opts = {}, keys = { { "-", "<cmd>Oil<CR>", desc = "File explorer" } } },

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<CR>", desc = "File tree" },
			{ "<leader>E", "<cmd>Neotree reveal<CR>", desc = "Reveal current file in tree" },
		},
		opts = {
			filesystem = {
				follow_current_file = { enabled = true },
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		},
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
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
		end,
	},
}
