#!/usr/bin/env bash

# Opens a tmux session from within a popup, switching the parent session
# Usage: open-session-from-popup.sh <directory>

DIR="$1"

if [ -z "$DIR" ]; then
  echo "Usage: open-session-from-popup.sh <directory>"
  exit 1
fi

# Get current session name (e.g., _popup_main_yazi)
CURRENT_SESSION=$(tmux display-message -p '#{session_name}')

# Extract parent session name (strip _popup_ prefix and _<popup-name> suffix)
PARENT_SESSION=$(echo "$CURRENT_SESSION" | sed 's/^_popup_//; s/_[^_]*$//')

# Create/get the target session name using tsm
# Run in detached mode - just ensure session exists
SESSION_NAME=$(basename "$DIR")
tsm session "$DIR" --detach 2>/dev/null || tmux new-session -d -s "$SESSION_NAME" -c "$DIR" 2>/dev/null

# Switch the parent's client to the new session
tmux switch-client -t "$PARENT_SESSION" -c "$SESSION_NAME" 2>/dev/null || \
  tmux switch-client -t "$SESSION_NAME"

# Exit to close the popup
exit 0
