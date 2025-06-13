# VS Code Extensions Manager

A simple utility to help manage your VS Code extensions by exporting a list of installed extensions and selectively removing them.

## Overview

This project provides two main scripts:

1. `export_extensions.sh` - Exports your currently installed VS Code extensions to a timestamped JSON file
2. `remove_extensions.sh` - Provides an interactive way to remove extensions from a list

## Files

- **export_extensions.sh**: Exports all currently installed VS Code extensions to a JSON file with a timestamp. Also creates a copy called `to_be_removed.json` that you can edit to select extensions for removal.
- **remove_extensions.sh**: Reads the `to_be_removed.json` file and prompts you to confirm removal for each extension.
- **to_be_removed.json**: A list of extensions to be considered for removal.
- **vscode-extensions-*.json**: Timestamped backups of your extension lists.

## Usage

### Exporting Extensions

```bash
./export_extensions.sh
```

This will:
1. Export all your installed extensions to a new timestamped JSON file (`vscode-extensions-YYYYMMDD-HHMMSS.json`)
2. Create a copy named `to_be_removed.json` that you can edit

### Removing Extensions

1. Edit `to_be_removed.json` to keep only the extensions you want to remove
2. Run:

```bash
./remove_extensions.sh
```

3. You'll be prompted for each extension with a yes/no question before it's actually removed

## Requirements

- Visual Studio Code (`code` command must be in your PATH)
- jq (JSON processor)

## Installation

1. Clone this repository
2. Make the scripts executable:

```bash
chmod +x export_extensions.sh remove_extensions.sh
```

## Tips

- Keep your latest extension exports as backups before major system changes
- Edit the `to_be_removed.json` file to customize which extensions you want to remove
- You can remove all extensions in the list by answering 'y' to all prompts
- You can skip any extension by answering 'n' to its prompt

## License

MIT

## Author

[Your Name]
