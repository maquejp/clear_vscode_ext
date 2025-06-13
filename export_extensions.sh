#!/bin/bash

# Generate timestamp
timestamp=$(date +%Y%m%d-%H%M%S)

# Define filenames
output_file="vscode-extensions-$timestamp.json"
copy_file="to_be_removed.json"

# Export extensions to JSON
code --list-extensions | jq -R . | jq -s . > "$output_file"

# Copy the file
cp "$output_file" "$copy_file"

# Optional: Output file info
echo "Exported extensions to $output_file"
echo "Copied to $copy_file"
