#!/bin/bash

set -euo pipefail

# loop through all directories in the current directory
for dir in */; do
    # extract the season number from the directory name
    season=$(echo "$dir" | grep -o -E '[sS][0-9]{2}')
    echo season: "$season"
    
    # loop through all files in the directory
    count=1
    for file in "$dir"*; do
        # extract the file extension and base filename
        extension="${file##*.}"
        filename="${file%.*}"
        
        # rename the file
        new_filename="${season}e$(printf "%02d" $count) - ${filename##*/}.${extension}"
        echo "$file" "${dir}${new_filename}"
        mv "$file" "${dir}${new_filename}"
        
        # increment the counter
        ((count++))
    done
done