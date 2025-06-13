#!/bin/bash

# Check if jq is installed
if ! command -v jq &> /dev/null; then
  echo "Error: jq is not installed. Please install it first."
  echo "Ubuntu/Debian: sudo apt-get install jq"
  echo "Fedora: sudo dnf install jq"
  echo "macOS: brew install jq"
  exit 1
fi

# Check if VS Code CLI is available
if ! command -v code &> /dev/null; then
  echo "Error: VS Code CLI is not installed or not in PATH."
  echo "Make sure VS Code is installed and the 'code' command is available."
  echo "You may need to run 'Install ''code'' command in PATH' from the VS Code command palette."
  exit 1
fi

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
