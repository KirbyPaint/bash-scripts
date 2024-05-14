#!/bin/bash

set -euo pipefail

# connect to tmux session
# C-c does ctrl+c
tmux send-keys -t vhserver C-c

sleep 10

tmux kill-session -t vhserver
