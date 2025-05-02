#!/bin/bash
set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

print_status() {
  echo -e "${GREEN}[*] $1${NC}"
}

print_error() {
  echo -e "${RED}[!] $1${NC}"
}

# Install stow if not present
install_stow() {
  if ! command -v stow &> /dev/null; then
    print_status "Installing stow..."
    if [ -f /etc/arch-release ]; then
      sudo pacman -S --noconfirm stow
    elif [ -f /etc/debian_version ]; then
      sudo apt update && sudo apt install -y stow
    else
      print_error "Unsupported OS. Please install 'stow' manually."
      exit 1
    fi
  fi
}

# Optional package installation
install_packages() {
  if [ -f packages.txt ]; then
    print_status "Installing packages from packages.txt..."
    if [ -f /etc/arch-release ]; then
      sudo pacman -S --noconfirm $(<packages.txt)
    elif [ -f /etc/debian_version ]; then
      sudo apt update && sudo apt install -y $(<packages.txt)
    else
      print_error "Unsupported OS. Install packages manually."
    fi
  fi
}

backup_existing_files() {
  for dir in */; do
    dir=${dir%/}
    cd "$dir"
    for file in $(find . -type f); do
      target="$HOME/${file#./}"
      if [ -e "$target" ] && [ ! -L "$target" ]; then
        mkdir -p "$HOME/.dotfile_backup/$(dirname "${file#./}")"
        cp "$target" "$HOME/.dotfile_backup/${file#./}"
        print_status "Backed up $target to ~/.dotfile_backup/${file#./}"
      fi
    done
    cd ..
  done
}

link_dotfiles() {
  for dir in */; do
    dir=${dir%/}
    print_status "Stowing $dir..."
    stow "$dir"
  done
}

main() {
  install_stow
  # install_packages
  backup_existing_files
  link_dotfiles
  print_status "Dotfiles bootstrapped successfully!"
}

main "$@"

