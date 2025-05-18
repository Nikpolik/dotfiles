CURRENT_DIR=$(pwd)

mkdir -p ~/.config

ln -sf "$CURRENT_DIR/.zshrc" ~/.zshrc
ln -sf "$CURRENT_DIR/.p10k.zsh" ~/.p10k.zsh
ln -sf "$CURRENT_DIR/.aerospace.toml" ~/.aerospace.toml
ln -sf "$CURRENT_DIR/.tmux.conf" ~/.tmux.conf
ln -sf "$CURRENT_DIR/.config/ghostty" ~/.config/
ln -sf "$CURRENT_DIR/.config/nvim" ~/.config/
ln -sf "$CURRENT_DIR/.config/sketchybar" ~/.config/
ln -sf "$CURRENT_DIR/.config/yazi" ~/.config/

# TMUX helper scripts
ln -sf "$CURRENT_DIR/bin/tmux/yazi-floating-selector.sh"  /usr/local/bin/tmux-yazi-floating-selector.sh
ln -sf "$CURRENT_DIR/bin/tmux/session-switcher.sh"  /usr/local/bin/tmux-session-switcher.sh
ln -sf "$CURRENT_DIR/bin/tmux/show-popup.sh"  /usr/local/bin/tmux-show-popup.sh
ln -sf "$CURRENT_DIR/bin/tmux/open-in-tmux.sh"  /usr/local/bin/tmux-open-in-tmux.sh
