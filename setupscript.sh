#!/bin/bash
# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print status messages
print_status() {
  echo -e "${GREEN}[*] $1${NC}"
}

# Function to print error messages
print_error() {
  echo -e "${RED}[!] $1${NC}"
}

# Create necessary directories
mkdir -p $HOME/.config/{htop,i3,nvim,picom,rofi}
mkdir -p $HOME/.local/bin
mkdir -p $HOME/scripts
mkdir -p $HOME/sounds
mkdir -p $HOME/wallpaper

create_symlink() {
  local source="$1"
  local target="$2"
  if [ -e "$source" ]; then
    if [ -e "$target" ]; then
      if [ -L "$target" ]; then
        print_status "Updating existing symlink: $target"
      else
        print_status "Replacing existing file with symlink: $target"
      fi
      rm -f "$target"
    else
      print_status "Creating new symlink: $target"
    fi
    ln -s "$source" "$target"
  else
    print_error "Source file does not exist: $source"
    return 1
  fi
}

print_status "Creating/updating symlinks for configuration files..."
create_symlink "$(pwd)/htop/htoprc" "$HOME/.config/htop/htoprc"
create_symlink "$(pwd)/i3/config" "$HOME/.config/i3/config"
create_symlink "$(pwd)/picom/picom.conf" "$HOME/.config/picom/picom.conf"
create_symlink "$(pwd)/rofi/config.rasi" "$HOME/.config/rofi/config.rasi"
create_symlink "$(pwd)/nvim" "$HOME/.config/nvim"

print_status "Creating/updating symlinks for scripts..."
create_symlink "$(pwd)/battery-notification/battery" "$HOME/.local/bin/battery"
create_symlink "$(pwd)/scripts/ssh-keygen.sh" "$HOME/scripts/ssh-keygen.sh"
create_symlink "$(pwd)/.gitconfig" "$HOME/.gitconfig"
create_symlink "$(pwd)/scripts/rttd" "$HOME/.local/bin"
create_symlink "$(pwd)/scripts/40-touch-pad.conf" "/etc/X11/xorg.conf.d/"
create_symlink "$(pwd)/scripts/rttd" "$HOME/.local/bin"
create_symlink "$(pwd)/.bashrc" "$HOME"
print_status "Copying wallpaper..."
cp -p wallpaper/wallpaper.jpg $HOME/wallpaper/

print_status "Setting permissions..."
chmod u+x $HOME/.local/bin/battery
chmod u+x $HOME/scripts/ssh-keygen.sh

print_status "Reloading systemd..."
sudo systemctl daemon-reload

print_status "Enabling and starting the battery notification timer..."
systemctl --user enable battery-notification.timer
systemctl --user start battery-notification.timer

print_status "ssh key generation"
$HOME/scripts/ssh-keygen.sh

source .bashrc
print_status "Checking required packages..."
packages=("i3" "picom" "rofi" "htop" "neovim")
for package in "${packages[@]}"; do
  if ! command -v $package &>/dev/null; then
    print_error "$package is not installed. Please install it manually."
  fi
done

print_status "Setup complete!"
