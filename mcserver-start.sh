#!/bin/bash

set -euo pipefail

# source ~/.bash_profile
if tmux has-session -t minecraft > /dev/null 2>&1; then
    :
else
    tmux -2 new-session -d -s minecraft
    tmux send-keys -t 0 "cd /home/plex/Desktop/mcserver/" Enter
    tmux send-keys -t 0 "./run-server.sh" Enter
fi
