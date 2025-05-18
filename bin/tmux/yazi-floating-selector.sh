#!/usr/bin/env bash

cleanup() {
  tmux kill-session -t "$SESSION_NAME" 2>/dev/null
}
trap cleanup EXIT

# Instead of using popup directly, create a new small tmux session
# This avoids the terminal response timeout issues
SESSION_NAME="yazi-selector"

# Kill the session if it already exists
tmux kill-session -t "$SESSION_NAME" 2>/dev/null


client_name=$(tmux display-message -p "#{client_name}")

# Create a new session with yazi starting from home directory
tmux new-session -d \
  -e CLIENT_NAME=$client_name \
  -e TERM=xterm-256color \
  -s "$SESSION_NAME" \
  -c "$HOME" \
  yazi

# Display the session in a larger popup window
tmux display-popup -w 80% -h 80% -E "tmux attach-session -t $SESSION_NAME"
