#!/usr/bin/env bash

# Determine the project root — fallback to session's default path if not in a git repo
project_root=$(git rev-parse --show-toplevel 2>/dev/null || tmux display-message -p -F "#{session_path}")

# If somehow we still don’t have a valid directory, exit
[[ -z "$project_root" || ! -d "$project_root" ]] && exit 1

# Open a horizontal split in the project root
tmux split-window -v -c "$project_root"
