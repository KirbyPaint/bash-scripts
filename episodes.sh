#!/bin/bash

set -euo pipefail

ls -aR /media/plex/media/tv | egrep '\.mp4$|\.mkv$' > /home/plex/Desktop/bot/episodeList.txt
ls -aR /media/plex/media/movies | egrep '\.mp4$|\.mkv$' > /home/plex/Desktop/bot/movieList.txt
