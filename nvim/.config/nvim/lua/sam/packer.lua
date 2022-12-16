-- ### PLUGINS

vim.cmd [[packadd packer.nvim]]
vim.cmd [[colorscheme tokyonight]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use('wbthomason/packer.nvim')

	use({
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	})

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	use('nvim-treesitter/playground')

	use('folke/tokyonight.nvim')

end)
