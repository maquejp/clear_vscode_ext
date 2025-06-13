#!/bin/bash

# VS Code Extensions Manager - A utility to manage VS Code extensions
# Author: Jean-Philippe Maquestiaux (maquejp)

# Source the dependency check helper
source "$(dirname "$0")/check_dependencies.sh"

# Check dependencies
check_dependencies

# Default values
OPERATION="help"
EXTENSIONS_FILE="vscode-extensions-to-be-removed.json"
YES_TO_ALL=false
VERBOSE=false

# Show help message
show_help() {
  echo "VS Code Extensions Manager - A utility to manage VS Code extensions"
  echo ""
  echo "Usage: $0 [options] [operation]"
  echo ""
  echo "Operations:"
  echo "  export    Export all installed extensions to a JSON file"
  echo "  remove    Interactively remove extensions from the JSON file"
  echo "  clean     Export and then remove in one operation"
  echo ""
  echo "Options:"
  echo "  -h, --help       Show this help message"
  echo "  -f, --file FILE  Use a specific file (default: $EXTENSIONS_FILE)"
  echo "  -y, --yes        Answer yes to all prompts (dangerous!)"
  echo "  -v, --verbose    Show more detailed output"
  echo ""
  echo "Examples:"
  echo "  $0 export                    # Export extensions to a timestamped file"
  echo "  $0 remove                    # Remove extensions interactively"
  echo "  $0 clean                     # Export and then remove in one step"
  echo "  $0 --file my-extensions.json remove  # Use a custom file"
}

# Export extensions function
export_extensions() {
  # Generate timestamp
  timestamp=$(date +%Y%m%d-%H%M%S)

  # Define filenames
  output_file="vscode-extensions-$timestamp.json"
  
  if [[ "$VERBOSE" == true ]]; then
    echo "Exporting VS Code extensions..."
  fi
  
  # Export extensions to JSON
  code --list-extensions | jq -R . | jq -s . > "$output_file"
  
  # Copy the file if needed
  if [[ "$output_file" != "$EXTENSIONS_FILE" ]]; then
    cp "$output_file" "$EXTENSIONS_FILE"
  fi
  
  echo "Exported extensions to $output_file"
  echo "Copied to $EXTENSIONS_FILE for editing"
  
  # Open file in default editor if verbose mode
  if [[ "$VERBOSE" == true ]]; then
    echo "You can now edit $EXTENSIONS_FILE to select which extensions to remove."
    
    # Wait for user to continue if not in yes-to-all mode
    if [[ "$YES_TO_ALL" == false ]]; then
      echo -n "Press Enter to continue..."
      read -r
    fi
  fi
}

# Remove extensions function
remove_extensions() {
  # Check if the file exists
  if [[ ! -f "$EXTENSIONS_FILE" ]]; then
    echo "Warning: $EXTENSIONS_FILE not found."
    
    # Ask if we should create it
    if [[ "$YES_TO_ALL" == true ]]; then
      do_export=true
    else
      echo -n "Do you want to export extensions now? (y/N): "
      read -r response
      if [[ "$response" == "y" || "$response" == "Y" ]]; then
        do_export=true
      else
        do_export=false
      fi
    fi
    
    if [[ "$do_export" == true ]]; then
      export_extensions
      
      # Check if the file was created
      if [[ ! -f "$EXTENSIONS_FILE" ]]; then
        echo "Error: Failed to create $EXTENSIONS_FILE."
        exit 1
      fi
    else
      echo "Operation cancelled."
      exit 0
    fi
  fi
  
  # Count extensions in file
  extension_count=$(jq length "$EXTENSIONS_FILE")
  
  if [[ "$extension_count" -eq 0 ]]; then
    echo "No extensions found in $EXTENSIONS_FILE. Nothing to remove."
    exit 0
  fi
  
  echo "Found $extension_count extensions in $EXTENSIONS_FILE"
  
  # Process extensions
  jq -r '.[]' "$EXTENSIONS_FILE" | while read -r extension; do
    if [[ "$YES_TO_ALL" == true ]]; then
      confirm="y"
    else
      # Prompt using /dev/tty to ensure interactive input works
      echo -n "Uninstall extension '$extension'? (y/N): " > /dev/tty
      read -r confirm < /dev/tty
    fi

    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
      echo "Uninstalling $extension..."
      code --uninstall-extension "$extension"
    else
      echo "Skipped $extension."
    fi
  done
  
  echo "Done processing extensions."
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      show_help
      exit 0
      ;;
    -f|--file)
      EXTENSIONS_FILE="$2"
      shift
      shift
      ;;
    -y|--yes)
      YES_TO_ALL=true
      shift
      ;;
    -v|--verbose)
      VERBOSE=true
      shift
      ;;
    export|remove|clean)
      OPERATION="$1"
      shift
      ;;
    *)
      echo "Unknown option: $1"
      show_help
      exit 1
      ;;
  esac
done

# Execute the requested operation
case $OPERATION in
  export)
    export_extensions
    ;;
  remove)
    remove_extensions
    ;;
  clean)
    export_extensions
    remove_extensions
    ;;
  *)
    show_help
    ;;
esac

exit 0
