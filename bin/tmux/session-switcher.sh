#!/usr/bin/env bash

# tmux-session-switcher.sh
# This script lists all tmux sessions, allows selection with fzf,
# and switches to the selected session

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
  echo "Error: fzf is not installed. Please install it first."
  exit 1
fi

# Get a list of all tmux sessions, formatted for display
# Format: path<tab>padded_name<tab>[status]
SESSIONS=$(tsm session list -f path-first | awk -F'\t' '{printf "%s\t%-12s\t%s\n", $1, $2, $3}')

# Exit if there are no sessions
if [ -z "$SESSIONS" ]; then
  echo "No tmux sessions found"
  exit 1
fi

RESULT=$(echo "$SESSIONS" | fzf \
  --delimiter='\t' \
  --with-nth=2,3 \
  --margin=0,1 \
  --border \
  --reverse \
  --prompt="Sessions > " \
  --header="Select session | Ctrl-D: kill | Ctrl-N: yazi" \
  --query="" \
  --select-1 \
  --exit-0 \
  --expect=ctrl-n \
  --bind "ctrl-d:execute-silent(tmux kill-session -t {2})+reload(tsm session list -f path-first | awk -F'\t' '{printf \"%s\t%-12s\t%s\\n\", \$1, \$2, \$3}')")

# Parse the result - first line is the key pressed, second line is the selection
KEY=$(echo "$RESULT" | head -n1)
SELECTED_PATH=$(echo "$RESULT" | tail -n1 | cut -f1)

# Check if user pressed Ctrl+N to launch yazi
if [ "$KEY" = "ctrl-n" ]; then
  exec env TERM=xterm-256color yazi
fi

# Switch to selected session if a selection was made
if [ -n "$SELECTED_PATH" ]; then
  tsm session "$SELECTED_PATH"
fi
