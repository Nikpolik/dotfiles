# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Github CLI
brew install gh

gh auth login

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install p10k omz theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# syntax highlighting for zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# fast syntax highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# autocomplete
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# ls replacement
brew install eza

# grep replacement
brew install ripgrep

# used by telescope to search files
brew install fd

brew install tmux

brew install nvim

# Terminal file manager
brew install yazi

# Install smart-enter yazi extension
ya pack -a yazi-rs/plugins:smart-enter

# tig is a better git log viewer
brew install tig

brew install tree

brew install luarocks

brew tap FelixKratz/formulae
brew install sketchybar

brew install font-hack-nerd-font

brew install --cask sf-symbols

brew install jq

brew install fzf

brew install orbstack

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Install pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# catppuccin theme for tmux
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

# install tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

