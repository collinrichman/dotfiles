# My Dotfiles

Personal development environment configuration files and package management.

## New Machine Setup

1. **Install Homebrew first:**
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Clone this repository:**
   ```bash
   git clone https://github.com/collinrichman/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

3. **Run the install script:**
   ```bash
   ./install.sh
   ```

4. **Restart your terminal or reload your shell:**
   ```bash
   source ~/.zshrc
   ```

## Adding New Homebrew Packages

When you install new packages, update your Brewfile to keep everything in sync:

1. **Install your new package:**
   ```bash
   brew install new-package-name
   # or
   brew install --cask new-app-name
   ```

2. **Update your Brewfile:**
   ```bash
   cd ~/.dotfiles
   brew bundle dump --force
   ```

3. **Commit the changes:**
   ```bash
   git add Brewfile
   git commit -m "Add new-package-name to Brewfile"
   git push
   ```

## Modifying Configurations

- Edit files in `~/.dotfiles/` (they're symlinked to your home directory)
- Changes take effect immediately
- Commit your changes with git when you're happy with them

## What's Included

- **Shell configuration** (`.zshrc`) with useful aliases and tool setup
- **Git configuration** (`.gitconfig` and `.gitignore_global`)
- **Homebrew package list** (`Brewfile`) for easy installation on new machines
- **Automatic backup** of existing configs during initial setup
