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

# File containing the list of extensions to remove
file="to_be_removed.json"

# Check if the file exists
if [[ ! -f "$file" ]]; then
  echo "Error: $file not found."
  exit 1
fi

# Use jq to get each extension and process in a loop
jq -r '.[]' "$file" | while read -r extension; do
  # Prompt using /dev/tty to ensure interactive input works
  echo -n "Uninstall extension '$extension'? (y/N): " > /dev/tty
  read -r confirm < /dev/tty

  if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    echo "Uninstalling $extension..."
    code --uninstall-extension "$extension"
  else
    echo "Skipped $extension."
  fi
done

echo "Done processing extensions."
