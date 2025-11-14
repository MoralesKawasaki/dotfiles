#!/bin/bash

# File names with packages list
PACMAN_FILE="$HOME/dotfiles/pacman_pkglist.txt"
AUR_FILE="$HOME/dotfiles/yay_pkglist.txt"

# Function for pacman installer
install_pacman_deps() {
	echo "## 󰏓  Starting pacman package installation from repositories..."

	# Check if fle exists and is not empty
	if [ -s "$PACMAN_FILE" ]; then
		sudo pacman -S --needed - < "$PACMAN_FILE"
	else
		echo "File @PACMAN_FILE does not exists or is empty. Skipping pacman installation..."
	fi

	echo "## 󰘽  Finished installation of pacman packages"
	echo ""
}

# Function for yay installer
install_aur_deps() {
	echo "## 󰣇󰀼  Starting AUR package installation from AUR repositories..."
	
	if [ -s "$AUR_FILE" ]; then
		yay -S --needed - < "$AUR_FILE"
	else
		echo "File $AUR_FILE does not exists or is empty. Skipping AUR installation..."
	fi

	echo "## 󰘽  Finished AUR installation."
	echo ""
}

run_deps_installer() {

# Main install section
# lets update pacman
sudo pacman -Sy

# 1. Install pacman deps
install_pacman_deps

# 2. Install AUR deps
install_aur_deps
}
