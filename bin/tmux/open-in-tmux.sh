folder="$1"
session="$(basename "$folder")"

# Check if the path is a directory
if [ ! -d "$folder" ]; then
    echo "Error: '$folder' is not a directory"
    exit 0
fi

# 1. ensure session exists (detached, in the right CWD)
if ! tmux has-session -t "$session" 2>/dev/null; then
  tmux new-session -d -s "$session" -c "$folder"
fi

# 2. if we launched Yazi in a tmux popup…
if [ -n "$CLIENT_NAME" ]; then
  # switch that client into the session
  tmux switch-client -c "$CLIENT_NAME" -t "$session"
  tmux kill-pane -t "$TMUX_PANE"
# 3. else if we’re in a normal tmux client…
elif [ -n "$TMUX" ]; then
  tmux switch-client -c "$folder" -t "$session"
fi
