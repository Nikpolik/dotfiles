#!/bin/bash

# show-tmux-popup.sh
# Creates a persistent popup terminal unique to each tmux session

# Create a session name based on the current tmux session
session="_popup_$(tmux display -p '#S')"

# Check if the session already exists, create it if not
if ! tmux has -t "$session" 2> /dev/null; then
  # Create a new session and capture its ID
  session_id="$(tmux new-session -dP -s "$session" -F '#{session_id}')"
  
  # Configure the session with popup-specific settings
  tmux set-option -s -t "$session_id" key-table popup
  tmux set-option -s -t "$session_id" status off
  tmux set-option -s -t "$session_id" prefix None

  # Use the session ID for attachment
  session="$session_id"
fi

# Attach to the session
exec tmux attach -t "$session" > /dev/null
