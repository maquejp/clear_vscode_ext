# Contributing to VS Code Extensions Manager

Thank you for your interest in contributing to this project! Here are some guidelines to help you get started.

## Code of Conduct

This project adheres to the Contributor Covenant [code of conduct](CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report unacceptable behavior.

## How Can I Contribute?

### Reporting Bugs

- Check the issue tracker to see if the bug has already been reported.
- If not, create a new issue with a descriptive title and clear description.
- Include steps to reproduce the issue, expected behavior, and actual behavior.
- Add any relevant screenshots or error messages.

### Suggesting Enhancements

- Check the issue tracker to see if the enhancement has already been suggested.
- Create a new issue with a descriptive title and clear description.
- Explain why this enhancement would be useful to most users.

### Pull Requests

1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Make your changes
4. Run tests if applicable
5. Commit your changes using [Conventional Commits](https://www.conventionalcommits.org/) format:
   - `feat: add new feature`
   - `fix: correct bug`
   - `docs: update documentation`
   - `refactor: restructure code without changing behavior`
   - `test: add or update tests`
   - `chore: update build tasks, package manager configs, etc.`
6. Push to the branch: `git push origin feature/your-feature-name`
7. Submit a pull request

## Styleguides

### Git Commit Messages

- Use the [Conventional Commits](https://www.conventionalcommits.org/) format
- Use the present tense ("add feature" not "added feature")
- Use the imperative mood ("move cursor to..." not "moves cursor to...")
- Limit the first line to 72 characters or less
- Reference issues and pull requests after the first line

### Bash Styleguide

- Use 2 space indentation
- Add comments to explain complex logic
- Make scripts executable
- Include appropriate shebang line: `#!/bin/bash`
- Always quote variables: `"$variable"` not `$variable`
- Use meaningful variable and function names
- Check for required commands at the start of the script

## Additional Notes

- Please ensure your code works on different platforms (Linux, macOS, Windows with WSL)
- Test your scripts before submitting a pull request
- Update documentation as needed
