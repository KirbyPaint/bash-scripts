#!/bin/bash

set -euo pipefail

# ls -aR : List all files, including hidden files, recursively
# grep -E : Interpret PATTERNS as extended regular expressions
ls -aR /media/plex/media/tv | grep -E '\.mp4$|\.mkv$' > /home/plex/Documents/text_files/episodeList.txt
ls -aR /media/plex/media/movies | grep -E '\.mp4$|\.mkv$' > /home/plex/Documents/text_files/movieList.txt
ls /media/plex/media/tv > /home/plex/Documents/text_files/showList.txt
