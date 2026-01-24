#!/bin/bash

RESULT=$(git branch |
    fzf --height=50% \
        --reverse \
        --border \
        --preview-window=down:1:wrap \
        --preview='echo {}' \
        --prompt="Select branch: " \
        --header="Enter: switch | Ctrl-N: create new branch" \
        --expect=ctrl-n)

KEY=$(echo "$RESULT" | head -n1)
SELECTION=$(echo "$RESULT" | tail -n1)
branch=$(echo "$SELECTION" | sed 's/^[* ]*//g' | xargs)

if [ "$KEY" = "ctrl-n" ]; then
    NEW_BRANCH="$branch"

    if [ -z "$NEW_BRANCH" ]; then
        echo "Error: Branch name cannot be empty"
        exit 1
    fi

    if ! git check-ref-format --branch "$NEW_BRANCH" 2>/dev/null; then
        echo "Error: Invalid branch name '$NEW_BRANCH'"
        exit 1
    fi

    if git rev-parse --verify "$NEW_BRANCH" >/dev/null 2>&1; then
        echo "Error: Branch '$NEW_BRANCH' already exists"
        exit 1
    fi

    git switch --create "$NEW_BRANCH"
    exit 0
fi

if [ -z "$branch" ]; then
    exit 0
fi

if [[ $branch == remotes/origin/* ]]; then
    branch=${branch#remotes/origin/}
fi

git switch "$branch"
