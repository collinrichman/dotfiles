# Claude Instructions for Dotfiles Repository

This repository contains my personal development environment setup for macOS. It includes shell configuration, git settings, VS Code preferences, and package management.

## Key Features

- **Configuration files**: `.zshrc`, `.gitconfig.template`, `.gitignore_global`, `vscode-settings.json`
- **Package management**: `Brewfile` (Homebrew), `npm-globals.txt` (global npm packages)
- **Setup automation**: `install.sh` (handles symlinks, backups, and package installation)

## Common Tasks

**Adding new packages:**
- Homebrew: `brew install package-name && brew bundle dump --force`
- npm globals: `npm install -g package-name && echo "package-name" >> npm-globals.txt`

**Updating dotfile configs:**
- Changes take effect immediately via the symlinks created by `install.sh`

**Setting up new machine:**
- Run `./install.sh` to set up everything automatically

## Context for Claude

This is a well-maintained dotfiles repository that follows best practices. When making changes:
- Maintain the existing structure and conventions
- Test changes with the install script
- Update documentation (README.md) when adding new features
- Consider cross-machine compatibility (all macOS)
- Keep package lists synchronized with actual installations
