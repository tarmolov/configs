#!/usr/bin/env bash
# Update dotfiles: pull latest changes and re-run setup
set -e

echo "Pulling latest changes..."
git pull

echo "Re-running build.sh..."
bash build.sh "$@"

echo "Update complete."
