# VS Code Extensions Manager

A simple utility to help manage your VS Code extensions by exporting a list of installed extensions and selectively removing them.

## Overview

This project provides a script to manage your VS Code extensions:

`vscode-extensions-manager.sh` - A unified tool that handles both exporting and removing extensions with various options.

## Files

- **vscode-extensions-manager.sh**: All-in-one script for exporting and removing extensions with command-line options
- **check_dependencies.sh**: Helper script that contains common dependency checks for jq and VS Code CLI
- **vscode-extensions-to-be-removed.json**: A list of extensions to be considered for removal
- **vscode-extensions-*.json**: Timestamped backups of your extension lists
- **README.md**: This documentation file with instructions and troubleshooting tips

## Usage

```bash
./vscode-extensions-manager.sh [options] [operation]
```

### Operations

- `export`: Export all installed extensions to a JSON file
- `remove`: Interactively remove extensions from the JSON file
- `clean`: Export and then remove in one operation

### Options

- `-h, --help`: Show help message
- `-f, --file FILE`: Use a specific file (default: vscode-extensions-to-be-removed.json)
- `-y, --yes`: Answer yes to all prompts (dangerous!)
- `-v, --verbose`: Show more detailed output

### Examples

```bash
# Export extensions to a timestamped file
./vscode-extensions-manager.sh export

# Remove extensions interactively
./vscode-extensions-manager.sh remove

# Export and then remove in one step
./vscode-extensions-manager.sh clean

# Use a custom file
./vscode-extensions-manager.sh --file my-extensions.json remove
```

## Requirements

- Visual Studio Code (`code` command must be in your PATH)
- jq (JSON processor) - Required for parsing JSON data

The script automatically checks for these dependencies and will display helpful error messages if they're missing.

### Setting up the VS Code CLI

To make the `code` command available in your terminal:

1. Open VS Code
2. Press `F1` or `Ctrl+Shift+P` to open the command palette
3. Type "shell command" and select "Install 'code' command in PATH"
4. Restart your terminal

### Installing jq

If jq is not installed on your system:

- **Ubuntu/Debian**: `sudo apt-get install jq`
- **Fedora/RHEL**: `sudo dnf install jq`
- **macOS**: `brew install jq`
- **Windows**: Use Chocolatey: `choco install jq` or download from [stedolan.github.io/jq](https://stedolan.github.io/jq/)

## Installation

1. Clone this repository
2. Make the scripts executable:

```bash
chmod +x vscode-extensions-manager.sh check_dependencies.sh
```

## Tips

- Keep your latest extension exports as backups before major system changes
- Edit the `vscode-extensions-to-be-removed.json` file to customize which extensions you want to remove
- Use the `-y` flag with caution as it will remove extensions without prompting
- You can skip any extension by answering 'n' to its prompt when not using `-y`

## Troubleshooting

- **"jq is not installed"**: The scripts will check for jq and notify you if it's missing. See the Requirements section for installation instructions.
- **"VS Code CLI is not installed or not in PATH"**: Make sure VS Code is installed and the `code` command is available from your terminal. Follow the instructions in the "Setting up the VS Code CLI" section above.
- **Permission denied errors**: If you encounter permission errors when running the scripts, make sure they are executable using `chmod +x *.sh`.
- **Empty extension list**: If no extensions are listed, make sure VS Code is properly installed and the `code` command works in your terminal.

## Contributing

Contributions are welcome! Please read the [Contributing Guide](CONTRIBUTING.md) for more information.

## Code of Conduct

Please read the [Code of Conduct](CODE_OF_CONDUCT.md) to understand the community expectations.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Jean-Philippe Maquestiaux (maquejp)

## Safety Features

- **Dependency Checks**: Automatically verifies jq and VS Code are properly installed
- **Interactive Prompts**: Confirms each extension removal to prevent accidental deletions
- **Timestamped Backups**: Creates dated backups of your extension lists
- **Detailed Error Messages**: Provides clear instructions when issues are encountered
- **Command Line Options**: Flexible usage with various options for automation
