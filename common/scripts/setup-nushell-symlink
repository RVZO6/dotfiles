#!/bin/bash

# Setup nushell symlink for macOS
# 
# Nushell on macOS uses ~/Library/Application Support/nushell instead of ~/.config/nushell
# This script creates a symlink from the macOS location to the stowed config in ~/.config/nushell
# 
# Usage: Run this after stowing your common dotfiles to ensure nushell can find its config

# Create symlink from macOS nushell location to the stowed config
ln -sf ~/.config/nushell ~/Library/Application\ Support/nushell

echo "✓ Nushell symlink created: ~/Library/Application Support/nushell -> ~/.config/nushell"