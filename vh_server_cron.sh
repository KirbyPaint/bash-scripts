#!/bin/bash

set -euo pipefail

# source ~/.bash_profile
if tmux has-session -t vhserver > /dev/null 2>&1; then
    :
else
    tmux -2 new-session -d -s vhserver
    tmux send-keys -t 0 "cd ~/.steam/steamcmd/valheim" Enter
    tmux send-keys -t 0 "./valheim.sh" Enter
fi
