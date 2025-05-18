#!/usr/bin/env bash

# tmux-yazi-floating-selector.sh
# This script opens yazi file browser in a more compatible way for macOS
# Once a folder is selected in yazi, it opens a new tmux session with that folder

# Create a temporary file to store the selected directory
TEMP_FILE=$(mktemp)

# Function to cleanup temp file on exit
cleanup() {
  rm -f "$TEMP_FILE"
  tmux kill-session -t "$SESSION_NAME" 2>/dev/null
}
trap cleanup EXIT

# Instead of using popup directly, create a new small tmux session
# This avoids the terminal response timeout issues
SESSION_NAME="yazi-selector"

# Kill the session if it already exists
tmux kill-session -t "$SESSION_NAME" 2>/dev/null

# Create a new session with yazi starting from home directory
tmux new-session -d -s "$SESSION_NAME" -c "$HOME" "export TERM=xterm-256color && yazi --chooser-file=$TEMP_FILE"

# Display the session in a larger popup window
tmux display-popup -w 80% -h 80% -E "tmux attach-session -t $SESSION_NAME"

# Check if we have a selected directory
if [ -s "$TEMP_FILE" ]; then
  SELECTED_DIR=$(cat "$TEMP_FILE")
  
  # If a directory was selected
  if [ -d "$SELECTED_DIR" ]; then
    # Create a session name based on the directory
    NEW_SESSION_NAME=$(basename "$SELECTED_DIR" | tr '.' '_')
    
    # Check if a session with this name already exists
    if ! tmux has-session -t "$NEW_SESSION_NAME" 2>/dev/null; then
      # Create new session with the selected directory
      tmux new-session -d -s "$NEW_SESSION_NAME" -c "$SELECTED_DIR"
    fi
    
    # Switch to the session
    tmux switch-client -t "$NEW_SESSION_NAME"
  fi
fi
