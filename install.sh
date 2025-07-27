#!/bin/bash

# Backup existing files
backup_dir="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup_dir"

# Files to symlink
files=".zshrc .gitconfig .gitignore_global"

for file in $files; do
    if [ -f "$HOME/$file" ]; then
        echo "Backing up existing $file"
        mv "$HOME/$file" "$backup_dir/"
    fi
    
    echo "Creating symlink for $file"
    ln -sf "$HOME/.dotfiles/$file" "$HOME/$file"
done

echo "Dotfiles installed! Restart your terminal or run 'source ~/.zshrc'"

echo "Installing Homebrew packages..."
if [ -f "$HOME/.dotfiles/Brewfile" ]; then
    brew bundle install --file="$HOME/.dotfiles/Brewfile"
    echo "Homebrew packages installed!"
else
    echo "No Brewfile found, skipping package installation"
fi

echo "Installing global npm packages..."
if [ -f "$HOME/.dotfiles/npm-globals.txt" ]; then
    cat "$HOME/.dotfiles/npm-globals.txt" | xargs npm install -g
    echo "Global npm packages installed!"
else
    echo "No npm-globals.txt found, skipping global npm installation"
fi

echo "Setting up VS Code configuration..."
vscode_config_dir="$HOME/Library/Application Support/Code/User"
if [ -d "$vscode_config_dir" ]; then
    if [ -f "$vscode_config_dir/settings.json" ]; then
        echo "Backing up existing VS Code settings"
        mv "$vscode_config_dir/settings.json" "$backup_dir/"
    fi
    echo "Creating symlink for VS Code settings"
    ln -sf "$HOME/.dotfiles/vscode-settings.json" "$vscode_config_dir/settings.json"
    echo "VS Code settings configured!"
else
    echo "VS Code not found, skipping settings configuration"
fi

echo "Configuring macOS system settings..."
if [ -f "$HOME/.dotfiles/mac-settings.sh" ]; then
    bash "$HOME/.dotfiles/mac-settings.sh"
    echo "macOS settings applied!"
else
    echo "No mac-settings.sh found, skipping macOS configuration"
fi
