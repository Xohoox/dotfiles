vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- design
  use 'Mofiqul/vscode.nvim' -- colorsheme
  use 'nvim-lualine/lualine.nvim' -- statusline
  use 'kyazdani42/nvim-web-devicons' -- icons
  use "lukas-reineke/indent-blankline.nvim" -- vertical lines for indents

  -- tpope
  use 'tpope/vim-surround'
  -- use 'tpope/vim-speeddating'
  use 'tpope/vim-endwise'
  -- use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive' -- git

  -- commentary
  use 'numToStr/Comment.nvim'

  -- close ("'{
  use 'Raimondi/delimitMate'

  -- telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

  -- nice windows
  use 'mbbill/undotree'
  use 'junegunn/vim-peekaboo'

  -- text edeting
  use 'folke/zen-mode.nvim'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'

  -- snipets
  use 'L3MON4D3/LuaSnip'

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lua'
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind.nvim'
  -- use 'hrsh7th/cmp-cmdline'

  -- treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'

  -- lua
  use 'nanotee/luv-vimdocs'
  use 'milisims/nvim-luaref'

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
	tag = 'nightly'
  }

  -- images
  use 'edluffy/hologram.nvim'

  -- plugins in development
  use '/home/fynn/rep/nvim-plugins/run-shell.nvim'

end)
