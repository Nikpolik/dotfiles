-- [[ plug.lua ]]

return require('packer').startup(function(use)
  -- Packer will delete itself unless we add it as depency
  use { 'wbthomason/packer.nvim' } 

  -- [[ Plugins Go Here ]]
  use {                                              -- filesystem navigation
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
  }


  --  Color Schemes
  use { 'ayu-theme/ayu-vim' }
  use { 'NLKNguyen/papercolor-theme' }
  use { 'sonph/onehalf', rtp = 'vim' }
  use { 'kaicataldo/material.vim' }

  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }  
  use { 'nvim-telescope/telescope-fzy-native.nvim' }

  -- use { 'nvim-treesitter/nvim-treesitter', do: 'TSUpdate' }

  use { 'feline-nvim/feline.nvim' }

  -- autocomplete
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'neovim/nvim-lspconfig' }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'akinsho/toggleterm.nvim',
    tag = 'v2.*'
  }
end)


