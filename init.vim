
source $HOME/.config/nvim/map.vim
source $HOME/.config/nvim/plug.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/nerdtree.vim
source $HOME/.config/nvim/ft.vim
source $HOME/.config/nvim/format.vim
source $HOME/.config/nvim/completion.vim

lua require('lsp-configuration')
lua require('telescope-config')
lua require('treesitter-config')
lua require('icons')

set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
