return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'
	use 'sheerun/vim-polyglot'
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'simrat39/rust-tools.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-context'
	use {
  		'nvim-telescope/telescope.nvim',
  		requires = { {'nvim-lua/plenary.nvim'}, {'nvim-treesitter/nvim-treesitter'} }
	}
	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {
  		'pwntester/octo.nvim',
  		requires = {
    			'nvim-lua/plenary.nvim',
    			'nvim-telescope/telescope.nvim',
    			'kyazdani42/nvim-web-devicons',
  		},
  		config = function ()
    			require"octo".setup()
  		end
	}
	use {
		'zivyangll/git-blame.vim'
	}
end)

