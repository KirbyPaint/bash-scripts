#!/bin/bash

# set -e - Exit immediately if a command exits with a non-zero status.
# set -u - Treat unset variables as an error when substituting.
# set -o pipefail - Causes a pipeline to produce a failure return code if any command fails.
set -euo pipefail

echo "Starting file renaming script..."

# Loop through each directory in the current directory.
# The directories must contain "Season" in the name, followed by two digits.
# Example: "Fake Show/Season 01"
for season_dir in ./*/Season\ [0-9][0-9]; do
  if [ -d "${season_dir}" ]; then
    echo "Processing season directory: ${season_dir}"

    # Get the show name from the parent directory of the current directory.
    show_name="$(basename "$(dirname "${season_dir}")")"
    echo "Detected show name: ${show_name}"

    # Get the season number from the current directory name.
    # The season number is the last two digits in the "Season" directory name.
    # Example: "Season 01" -> "01"
    season_number="$(echo "${season_dir}" | sed -E 's/.*Season[[:space:]]+([0-9]{2})$/\1/')"
    echo "Detected season number: ${season_number}"

    # Initialize the episode number to 1.
    episode_number=1

    # Loop through each file in the current directory.
    for file_path in "${season_dir}"/*; do
      if [ -f "${file_path}" ]; then
        # Get the file extension.
        file_extension="${file_path##*.}"

        # Get the file name without the extension.
        file_name="$(basename "${file_path}" ."${file_extension}")"

        # Generate the new file name using the show name, season number,
        # episode number, original file name, and original file extension.
        new_file_name="${show_name} - s${season_number}e$(printf '%02d' ${episode_number}) - ${file_name}.${file_extension}"
        echo "Renaming file: ${file_path} -> ${season_dir}/${new_file_name}"

        # Rename the file by moving it to the current directory with the new file name.
        mv "${file_path}" "${season_dir}/${new_file_name}"

        # Increment the episode number for the next file.
        ((episode_number++))
      fi
    done
  fi
done

echo "File renaming script completed successfully."%
