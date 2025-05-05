CURRENT_DIR=$(pwd)

mkdir -p ~/.config

ln -sf "$CURRENT_DIR/.zshrc" ~/.zshrc
ln -sf "$CURRENT_DIR/.p10k.zsh" ~/.p10k.zsh
ln -sf "$CURRENT_DIR/.aerospace.toml" ~/.aerospace.toml
ln -sf "$CURRENT_DIR/.tmux.conf" ~/.tmux.conf
ln -sf "$CURRENT_DIR/.config/ghostty" ~/.config/ghostty
ln -sf "$CURRENT_DIR/.config/nvim" ~/.config/nvim
ln -sf "$CURRENT_DIR/.config/sketchybar" ~/.config/sketchybar
