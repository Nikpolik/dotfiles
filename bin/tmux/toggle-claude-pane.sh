#!/bin/bash

CLAUDE_WINDOW="_claude"
CURRENT_SESSION=$(tmux display -p '#{session_name}')
CLAUDE_TARGET="${CURRENT_SESSION}:${CLAUDE_WINDOW}"
CURRENT_PATH=$(tmux display -p '#{pane_current_path}')

tmux_pane_status=$(tmux list-panes -F '#{@tab_name}:#{pane_id}:#{pane_active}' | grep 'claude:' | head -1)

claude_pane=$(echo "$tmux_pane_status" | cut -d: -f2)
claude_focused=$(echo "$tmux_pane_status" | cut -d: -f3)

# If pane exists and focused, break it out into its own window
if [ -n "$claude_pane" ] && [ "$claude_focused" -eq 0 ]; then
  tmux select-pane -t "$claude_pane"
  exit 0
fi

if [ -n "$claude_pane" ]; then
  tmux break-pane -d -n "$CLAUDE_WINDOW" -s "$claude_pane"
  tmux setw -t "$CLAUDE_WINDOW" window-status-format ''
  tmux setw -t "$CLAUDE_WINDOW" window-status-current-format ''
  exit 0
fi

# if the claude window exists, but no pane, create a new pane in it
if ! tmux list-windows -F '#{window_name}' | grep -q "^${CLAUDE_WINDOW}$"; then
  tmux new-window -d -n "$CLAUDE_WINDOW" -c "$CURRENT_PATH" "claude"
fi

tmux select-pane -t "${CLAUDE_TARGET}.0" -T "claude"
new_pane=$(tmux join-pane -h -l 25% -s "${CLAUDE_TARGET}.0")
tmux set-option -p -t "$new_pane" @tab_name "claude"

# Function to create the claude pane
