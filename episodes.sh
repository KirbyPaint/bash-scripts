#!/bin/bash

set -euo pipefail

ls -aR /media/plex/media/tv | egrep '\.mp4$|\.mkv$' > /home/plex/Documents/text_files/episodeList.txt
ls -aR /media/plex/media/movies | egrep '\.mp4$|\.mkv$' > /home/plex/Documents/text_files/movieList.txt
ls /media/plex/media/tv > /home/plex/Documents/text_files/showList.txt
