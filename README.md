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

3. **Set up Git configuration:**
   ```bash
   cp .gitconfig.template .gitconfig
   git config --global user.name "Your Full Name"
   git config --global user.email "your.email@example.com"
   ```

4. **Run the install script:**
   ```bash
   ./install.sh
   ```

5. **Restart your terminal or reload your shell:**
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

## Adding Global npm Packages

When you install new global npm packages, update your npm-globals.txt to keep everything in sync:

1. **Install your new package:**
   ```bash
   npm install -g package-name
   ```

2. **Update npm-globals.txt:**
   ```bash
   cd ~/.dotfiles
   echo "package-name" >> npm-globals.txt
   ```

3. **Commit the changes:**
   ```bash
   git add npm-globals.txt
   git commit -m "Add package-name to global npm packages"
   git push
   ```

## Modifying Configurations

- Edit files in `~/.dotfiles/` (they're symlinked to your home directory)
- Changes take effect immediately
- Commit your changes with git when you're happy with them

## What's Included

- **Shell configuration** (`.zshrc`) with useful aliases and tool setup
- **Git configuration** (`.gitconfig.template` and `.gitignore_global`)
- **Homebrew package list** (`Brewfile`) for easy installation on new machines
- **Global npm packages** (`npm-globals.txt`) for development tools
- **Automatic backup** of existing configs during initial setup
