#!/bin/bash

# Source the dependency check helper
source "$(dirname "$0")/check_dependencies.sh"

# Check dependencies
check_dependencies

# File containing the list of extensions to remove
file="vscode-extensions-to-be-removed.json"

# Check if the file exists
if [[ ! -f "$file" ]]; then
  echo "Warning: $file not found."
  echo "Running export_extensions.sh to create it..."
  
  # Get the directory of the current script
  script_dir="$(dirname "$0")"
  
  # Run the export script
  bash "$script_dir/export_extensions.sh"
  
  # Check if the file was created
  if [[ ! -f "$file" ]]; then
    echo "Error: Failed to create $file."
    exit 1
  fi
  
  echo "File $file created. Continuing with extension removal..."
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
