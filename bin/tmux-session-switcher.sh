#!/usr/bin/env bash

# tmux-session-switcher.sh
# This script lists all tmux sessions, allows selection with fzf,
# and switches to the selected session

# Check if tmux is running
if ! tmux info &> /dev/null; then
  echo "Error: tmux is not running"
  exit 1
fi

# Check if we're already in a tmux session
if [ -z "$TMUX" ]; then
  echo "Error: Not inside a tmux session"
  exit 1
fi

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
  echo "Error: fzf is not installed. Please install it first."
  exit 1
fi

# Get a list of all tmux sessions
SESSIONS=$(tmux list-sessions -f '#{?#{m:_popup_*,#{session_name}},0,1}' -F "#{session_name}" | sort)

# Exit if there are no sessions
if [ -z "$SESSIONS" ]; then
  echo "No tmux sessions found"
  exit 1
fi

# Use fzf to select a session, with the current session highlighted
CURRENT_SESSION=$(tmux display-message -p '#{session_name}')
SELECTED_SESSION=$(echo "$SESSIONS" | fzf-tmux -p 50%,30% --reverse --prompt="Sessions > " --header="Select session (current: $CURRENT_SESSION)" --query="" --select-1 --exit-0)

# If a session was selected and it's different from the current one, switch to it
if [ -n "$SELECTED_SESSION" ] && [ "$SELECTED_SESSION" != "$CURRENT_SESSION" ]; then
  tmux switch-client -t "$SELECTED_SESSION"
elif [ -n "$SELECTED_SESSION" ] && [ "$SELECTED_SESSION" = "$CURRENT_SESSION" ]; then
  # If the selected session is the current one, just inform the user
  tmux display-message "Already in session: $CURRENT_SESSION"
fi
