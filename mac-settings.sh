#!/bin/bash

# macOS Settings Configuration
# Run this script to configure macOS system preferences

echo "Configuring macOS settings..."

# Dock settings
echo "Setting up Dock preferences..."
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 1
killall Dock

# Finder settings
echo "Setting up Finder preferences..."
defaults write com.apple.finder AppleShowAllFiles -bool true
killall Finder

echo "macOS settings configured successfully!"