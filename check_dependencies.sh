#!/bin/bash

# Function to check if jq is installed
check_jq() {
  if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed. Please install it first."
    echo "Ubuntu/Debian: sudo apt-get install jq"
    echo "Fedora: sudo dnf install jq"
    echo "macOS: brew install jq"
    return 1
  fi
  return 0
}

# Function to check if VS Code CLI is available
check_vscode_cli() {
  if ! command -v code &> /dev/null; then
    echo "Error: VS Code CLI is not installed or not in PATH."
    echo "Make sure VS Code is installed and the 'code' command is available."
    echo "You may need to run 'Install ''code'' command in PATH' from the VS Code command palette."
    return 1
  fi
  return 0
}

# Check both dependencies
check_dependencies() {
  check_jq || exit 1
  check_vscode_cli || exit 1
}

# Export functions
export -f check_jq
export -f check_vscode_cli
export -f check_dependencies
