#!/bin/bash

set -euo pipefail

for i in {1..7}
do
    # Create the folder
    mkdir folder_"$i"

    # Create the 20 blank text files in the folder
    for j in {1..20}
    do
        touch folder_"$i"/file_"$j".txt
    done
done