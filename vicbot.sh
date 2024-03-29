#!/bin/bash

set -euo pipefail

if tmux has-session -t vicbot > /dev/null 2>&1; then
    :
else
    tmux -2 new-session -d -s vicbot
    tmux send-keys -t 0 "cd /home/plex/Documents/vicbot/" Enter;
    tmux send-keys -t 0 "git pull origin main --rebase" Enter;
    tmux send-keys -t 0 "yarn install" Enter;
    tmux send-keys -t 0 "yarn superbuild" Enter;
fi
