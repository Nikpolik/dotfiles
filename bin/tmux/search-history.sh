#!/bin/zsh

# history-search - Search zsh history with fzf and copy selection to clipboard

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
    echo "Error: fzf is not installed. Please install fzf first."
    exit 1
fi

# Get history file path (default or from HISTFILE variable)
HIST_FILE=${HISTFILE:-~/.zsh_history}

# Check if history file exists
if [[ ! -f "$HIST_FILE" ]]; then
    echo "Error: History file not found at $HIST_FILE"
    echo "Your HISTFILE is set to: $HISTFILE"
    exit 1
fi

# Read history file, clean it up, and pipe to fzf
# The sed command removes the zsh extended history format timestamps
selected=$(cat "$HIST_FILE" | \
    sed 's/^: [0-9]*:[0-9]*;//' | \
    awk 'NF > 0 && !seen[$0]++' | \
    tail -r | \
    fzf --height=50% \
        --reverse \
        --border \
        --prompt="Search history > " \
        --preview-window=down:3:wrap \
        --preview='echo {}' \
        --header='Enter: copy to clipboard | Ctrl-C: exit')

# Copy selected command to clipboard if something was selected
if [[ -n "$selected" ]]; then
    echo "$selected" | pbcopy
    echo "Copied to clipboard: $selected"
fi
