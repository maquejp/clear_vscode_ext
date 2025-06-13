# VS Code Extensions Manager

A simple utility to help manage your VS Code extensions by exporting a list of installed extensions and selectively removing them.

## Overview

This project provides two main scripts:

1. `export_extensions.sh` - Exports your currently installed VS Code extensions to a timestamped JSON file
2. `remove_extensions.sh` - Provides an interactive way to remove extensions from a list

## Files

- **export_extensions.sh**: Exports all currently installed VS Code extensions to a JSON file with a timestamp. Also creates a copy called `to_be_removed.json` that you can edit to select extensions for removal. Checks for required dependencies before running.
- **remove_extensions.sh**: Reads the `to_be_removed.json` file and prompts you to confirm removal for each extension. Verifies dependencies and provides interactive yes/no prompts.
- **check_dependencies.sh**: Helper script that contains common dependency checks for jq and VS Code CLI.
- **to_be_removed.json**: A list of extensions to be considered for removal.
- **vscode-extensions-*.json**: Timestamped backups of your extension lists.
- **README.md**: This documentation file with instructions and troubleshooting tips.

## Usage

### Exporting Extensions

```bash
./export_extensions.sh
```

This will:
1. Export all your installed extensions to a new timestamped JSON file (`vscode-extensions-YYYYMMDD-HHMMSS.json`)
2. Create a copy named `vscode-extensions-to-be-removed.json` that you can edit

### Removing Extensions

1. Edit `vscode-extensions-to-be-removed.json` to keep only the extensions you want to remove
2. Run:

```bash
./remove_extensions.sh
```

3. If the file `vscode-extensions-to-be-removed.json` doesn't exist, the script will automatically run `export_extensions.sh` to create it
4. You'll be prompted for each extension with a yes/no question before it's actually removed

## Requirements

- Visual Studio Code (`code` command must be in your PATH)
- jq (JSON processor) - Required for parsing JSON data

Both scripts automatically check for these dependencies and will display helpful error messages if they're missing.

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
chmod +x export_extensions.sh remove_extensions.sh check_dependencies.sh
```

## Tips

- Keep your latest extension exports as backups before major system changes
- Edit the `to_be_removed.json` file to customize which extensions you want to remove
- You can remove all extensions in the list by answering 'y' to all prompts
- You can skip any extension by answering 'n' to its prompt

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
