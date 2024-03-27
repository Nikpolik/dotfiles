-- [[ plug.lua ]]

return require('packer').startup(function(use)
  -- Packer will delete itself unless we add it as depency
  use { 'wbthomason/packer.nvim' } 

  use { 'kyazdani42/nvim-web-devicons' }
  -- [[ Plugins Go Here ]]
  -- use {                                              -- filesystem navigation
  --   'kyazdani42/nvim-tree.lua',
  --   requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
  -- }


  --  Color Schemes
  use "EdenEast/nightfox.nvim"
  -- use { 'ayu-theme/ayu-vim' }
  -- use { 'NLKNguyen/papercolor-theme' }
  -- use { 'kaicataldo/material.vim' }
  use {
    'catppuccin/nvim',
    as = 'catppuccin'
  }
  -- use 'folke/tokyonight.nvim'
  -- use 'challenger-deep-theme/vim' 
  -- use 'Mofiqul/dracula.nvim'
  -- use 'kyoz/purify'
  -- use 'wadackel/vim-dogrun'
  -- use 'rhysd/vim-color-spring-night'
  -- use 'ackyshake/Spacegray.vim'
  -- use 'Yazeed1s/oh-lucy.nvim'
  -- use 'shaunsingh/nord.nvim'
  --
  use { "bluz71/vim-nightfly-colors", as = "nightfly" }
  use 'Rigellute/shades-of-purple.vim'
  use 'sainnhe/sonokai'
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }  
  use { 'nvim-telescope/telescope-fzy-native.nvim' }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use {
    'nvim-tree/nvim-tree.lua',
     requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
     },
  }

  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }
    -- Lua
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

   use {
       'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate'
   }

   use {
     'nvim-treesitter/nvim-treesitter-context',
   }



  use 'edkolev/tmuxline.vim'

  -- autocomplete
  use 'mfussenegger/nvim-jdtls'
  use { 'jose-elias-alvarez/null-ls.nvim'}
  use { 'L3MON4D3/LuaSnip' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'neovim/nvim-lspconfig' }
  use({ "glepnir/lspsaga.nvim" })

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

  use { 'norcalli/nvim-colorizer.lua' }

  -- Todo get it working
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use "FabijanZulj/blame.nvim"

  use "almo7aya/openingh.nvim"


  -- Get project specific settings like tabs
  use 'editorconfig/editorconfig-vim'

  -- Diff
  use "sindrets/diffview.nvim" 

  -- Persists undo and recover
  use 'chrisbra/Recover.vim'
  use 'mbbill/undotree'

  -- Tabs
  use 'nanozuki/tabby.nvim'
  use 'LukasPietzschmann/telescope-tabs'
  use 'lewis6991/gitsigns.nvim'

  use 'itchyny/lightline.vim'

  use 'github/copilot.vim'
  -- Packer
  use({
    "jackMort/ChatGPT.nvim",
    config = function()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })

  use 'junegunn/fzf'
end)


