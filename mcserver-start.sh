#!/bin/bash

set -euo pipefail

# source ~/.bash_profile
if tmux has-session -t minecraft > /dev/null 2>&1; then
    :
else
    tmux -2 new-session -d -s minecraft
    tmux send-keys -t 0 "cd /home/plex/Documents/chillcraft/" Enter
    # tmux send-keys -t 0 "cd /home/plex/Documents/mcserver-lite/" Enter
    tmux send-keys -t 0 "./r.sh" Enter
fi
