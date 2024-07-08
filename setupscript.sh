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

# Copy configuration files
print_status "Copying configuration files..."
cp htop/htoprc $HOME/.config/htop/
cp i3/config $HOME/.config/i3/
cp picom/picom.conf $HOME/.config/picom/
cp rofi/config.rasi $HOME/.config/rofi/

# Copy scripts
print_status "Copying scripts..."
cp battery-notification/battery $HOME/.local/bin
cp scripts/git-setup.sh $HOME/scripts/

# Copy systemd unit files
print_status "Setting up systemd units..."
sudo cp battery-notification/systemd/battery-notification.service /.config/systemd/user/
sudo cp battery-notification/systemd/battery-notification.timer /.config/systemd/user/

# Copy wallpaper
print_status "Copying wallpaper..."
cp wallpaper/wallpaper.jpg $HOME/wallpaper/

# Set correct permissions
print_status "Setting permissions..."
chmod +x $HOME/.local/bin/battery
chmod +x $HOME/scripts/git-setup.sh

# Reload systemd
print_status "Reloading systemd..."
sudo systemctl daemon-reload

# Enable and start the battery notification timer
print_status "Enabling and starting the battery notification timer..."
sudo systemctl enable battery-notification.timer
sudo systemctl start battery-notification.timer

# Setup git (assuming git-setup.sh contains git configurations)
print_status "Setting up git..."
$HOME/scripts/git-setup.sh


# Check if required packages are installed
print_status "Checking required packages..."
packages=("i3" "picom" "rofi" "htop" "neovim")
for package in "${packages[@]}"; do
    if ! command -v $package &> /dev/null; then
        print_error "$package is not installed. Please install it manually."
    fi
done

print_status "Setup complete!"
