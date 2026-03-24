#!/usr/bin/env bash
# Update dotfiles: pull latest changes and update vim plugins
set -e

cd ~/.config/tarmolov

echo "Pulling latest changes..."
git pull

echo "Updating vim plugins..."
vim -c ":PlugUpdate" -c ":qa"

echo "Update complete."
