#!/bin/bash

# List all objects and their sizes in MB
git rev-list --objects --all | while read -r hash path; do
    size=$(git cat-file -s "$hash")
    size_mb=$(echo "scale=2; $size / 1048576" | bc)
    echo "$size_mb MB $path"
done | sort -n | tail -20