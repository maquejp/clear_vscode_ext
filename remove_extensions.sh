#!/bin/bash

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
