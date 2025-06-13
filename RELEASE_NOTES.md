# VS Code Extensions Manager v1.0.0

## Overview

This is the first official release of VS Code Extensions Manager featuring a unified script for managing VS Code extensions.

## Key Features

- **Unified Management Script**: Single tool for both exporting and removing extensions
- **Command Line Options**: 
  - `export`: Export extensions to JSON file
  - `remove`: Interactively remove extensions
  - `clean`: Export and remove in one step
- **Flexible Usage**:
  - `-h, --help`: Show help message
  - `-f, --file FILE`: Use a custom file path
  - `-y, --yes`: Answer yes to all prompts (for automation)
  - `-v, --verbose`: Show more detailed output
- **Dependency Checks**: Automatic verification of jq and VS Code CLI
- **Improved User Experience**: Better feedback and error messages

## Major Changes

- Created a unified management script (`vscode-extensions-manager.sh`) replacing separate export and remove scripts
- Added command-line options for more flexible usage
- Added the ability to use custom file paths
- Added support for non-interactive usage (with `-y` flag)
- Reorganized documentation to focus on the unified approach
- Implemented better error handling and user feedback
- Added timestamped backups of extension lists

## Installation

1. Clone the repository
2. Make the scripts executable:
```bash
chmod +x vscode-extensions-manager.sh check_dependencies.sh
```

## Usage Examples

```bash
# Export extensions to a timestamped file
./vscode-extensions-manager.sh export

# Remove extensions interactively
./vscode-extensions-manager.sh remove

# Export and remove in one step
./vscode-extensions-manager.sh clean

# Use a custom file
./vscode-extensions-manager.sh --file my-extensions.json remove
```
