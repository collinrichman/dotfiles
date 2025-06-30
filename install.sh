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
    echo "Packages installed!"
else
    echo "No Brewfile found, skipping package installation"
fi
