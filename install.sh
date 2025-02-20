#!/bin/bash
# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

print_status() {
  echo -e "${GREEN}[*] $1${NC}"
}

print_error() {
  echo -e "${RED}[!] $1${NC}"
}

set -e

mkdir -p $HOME/.local/bin

sudo pacman -S - <packages.txt

for dir in */; do
  dir=${dir%/}
  echo "Stowing $dir..."
  stow "$dir"
done

echo "All configurations have been stowed successfully."
print_status "Reloading systemd..."
sudo systemctl daemon-reload

print_status "Enabling and starting the battery notification timer..."
systemctl --user enable battery-notification.timer
systemctl --user start battery-notification.timer

cd
source .zshrc

print_status "Setup complete!"
