#!/bin/bash

# Update system and install necessary packages
sudo pacman -Syu --noconfirm  # Update system
sudo pacman -S --needed --noconfirm \
    acpi \
    alacritty \
    alsa-utils \
    arc-gtk-theme \
    base \
    base-devel \
    bluez-utils \
    brightnessctl \
    fd \
    feh \
    firefox \
    grub \
    htop \
    i3blocks \
    intel-ucode \
    lxappearance \
    maim \
    neovim \
    picom \
    plocate \
    ripgrep \
    sof-firmware \
    tldr \
    tmux \
    tree \
    ttf-jetbrains-mono-nerd \
    ttf-nerd-fonts-symbols \
    ttf-nerd-fonts-symbols-mono \
    vlc \
    xorg-server \
    xorg-xinit \
    zram-generator


echo "Installation completed."

