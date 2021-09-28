call plug#begin('~/.config/nvim/plugged')

" Color Schemes
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ayu-theme/ayu-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdtree'

Plug 'neovim/nvim-lspconfig'

" Completion Plugins
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/completion-treesitter'

Plug 'dense-analysis/ale'

call plug#end()

