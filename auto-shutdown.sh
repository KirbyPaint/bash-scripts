#!/bin/bash

if tmux has-session -t minecraft > /dev/null 2>&1; then
    tmux send-keys -t 0 "stop" Enter
    shutdown --reboot 1 # reboot in 1 minute
    echo "System reboot initiated at $(date)" > /home/plex/Desktop/last-reboot.txt
    sleep 90
else
    shutdown --reboot 1
    echo "System reboot initiated at $(date)" > /home/plex/Desktop/last-reboot.txt
    sleep 90
fi
