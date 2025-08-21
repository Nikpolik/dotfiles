#!/bin/bash

# Get all branches, remove the current branch indicator (*), and pipe to fzf
branch=$(git branch | fzf --prompt="Select branch: " | sed 's/^[* ]*//g' | xargs)

# Exit if no branch was selected (user pressed ESC or Ctrl+C)
if [ -z "$branch" ]; then
    exit 0
fi

# Handle remote branches by extracting just the branch name
if [[ $branch == remotes/origin/* ]]; then
    branch=${branch#remotes/origin/}
fi

# Switch to the selected branch
git switch "$branch"
