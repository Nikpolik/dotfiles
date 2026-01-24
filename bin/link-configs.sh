CURRENT_DIR=$(pwd)

mkdir -p ~/.config
mkdir -p ~/bin

mkdir -p ~/.claude
ln -sf "$CURRENT_DIR/.claude/CLAUDE.md" ~/.claude/CLAUDE.md
ln -sf "$CURRENT_DIR/.claude/agents" ~/.claude/agents
ln -sf "$CURRENT_DIR/.zshrc" ~/.zshrc
ln -sf "$CURRENT_DIR/.p10k.zsh" ~/.p10k.zsh
ln -sf "$CURRENT_DIR/.aerospace.toml" ~/.aerospace.toml
ln -sf "$CURRENT_DIR/.tmux.conf" ~/.tmux.conf
ln -sf "$CURRENT_DIR/.config/ghostty" ~/.config/
ln -sf "$CURRENT_DIR/.config/nvim" ~/.config/
ln -sf "$CURRENT_DIR/.config/sketchybar" ~/.config/
ln -sf "$CURRENT_DIR/.config/yazi" ~/.config/yazi

# TMUX helper scripts
ln -sf "$CURRENT_DIR/bin/tmux/session-switcher.sh"  ~/bin/tmux-session-switcher.sh
ln -sf "$CURRENT_DIR/bin/tmux/branch-switcher.sh"  ~/bin/tmux-branch-switcher.sh
ln -sf "$CURRENT_DIR/bin/tmux/open-in-tmux.sh"  ~/bin/tmux-open-in-tmux.sh
ln -sf "$CURRENT_DIR/bin/tmux/search-history.sh" ~/bin/tmux-search-history.sh
# tsm config
mkdir -p ~/.config/tsm
ln -sf "$CURRENT_DIR/.config/tsm/config.toml" ~/.config/tsm/config.toml


# Git config
ln -sf "$CURRENT_DIR/git/.gitconfig" ~/.gitconfig
ln -sf "$CURRENT_DIR/git/.gitconfig-work" ~/.gitconfig-work
ln -sf "$CURRENT_DIR/git/.gitconfig-personal" ~/.gitconfig-personal
