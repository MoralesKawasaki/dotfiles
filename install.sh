#!/bin/bash

DOTFILES_ROOT=$(pwd)

DEP_INSTALLER="$DOTFILES_ROOT/Installer/install_deps.sh"

olddir=~/dotfiles_old

source "$DEP_INSTALLER"
run_deps_installer

mkdir -p $olddir

cd $DOTFILES_ROOT

mkdir -p $olddir/.config
config_files="hypr kitty rofi matugen nwg-look swaync Vencord waybar gtk-3.0 gtk-4.0"
for file in $config_files; do
	check_dir=~/.config/$file
	if [ -d "$check_dir" ] || [ -L "$check_dir " ] ; then
	    echo "## Moving already existing $file from ~/.config/$file to $olddir/.config/$file."
		mv ~/.config/$file $olddir/.config
	fi
	ln -s $DOTFILES_ROOT/.config/$file ~/.config/$file
	echo "## Symlink for $file for ~/.config/$file created succesfully!"
	echo ""
done

mkdir -p $olddir/.cache
cache_files="wal"
for file in $cache_files; do
	check_dir=~/.cache/$file
	if [ -d "$check_dir" ] || [ -L "$check_dir " ]; then
	    echo "## Moving already existing $file from ~/.cache/$file to $olddir/.cache/$file."
		mv ~/.cache/$file $olddir/.cache
	fi
	ln -s $DOTFILES_ROOT/.cache/$file ~/.cache/$file
	echo "## Symlink for $file for ~/.cache/$file created succesfully!"
	echo ""
done

mkdir -p $olddir/.local
local_files="bin"
for file in $local_files; do
	check_dir=~/.local/$file
	if [ -d "$check_dir" ] || [ -L "$check_dir " ] ; then
	    echo "## Moving already existing $file from ~/.local/$file to $olddir/.local/$file."
		mv ~/.local/$file $olddir/.local
	fi
	cp -r $DOTFILES_ROOT/.local/$file ~/.local/$file
	echo "## Symlink for $file for ~/.local/$file created succesfully!"
	echo ""
done

echo "## Giving permission for custom scripts."
sudo chmod +x ~/.local/bin/walset
sudo chmod +x ~/.local/bin/walset-backend
sudo chmod +x ~/.config/waybar/scripts/get_weather.sh
sudo chmod +x ~/.config/waybar/scripts/mediaplayer.py
sudo chmod +x ~/.config/waybar/scripts/reload.sh
echo "## Done."
echo ""

if [ -f "~/.bash_profile" ] || [ -L "bash_profile" ] ; then
	    echo "## Moving already existing .bash_profile from ~/.bash_profile to $olddir/.bash_profile"
		mv ~/.bash_profile $olddir
		ln -s $DOTFILES_ROOT/.bash_profile ~/
	fi


if [ -f "~/.bashrc" ] || [ -L ".bashrc" ] ; then
	    echo "## Moving already existing .bashrc from ~/.bashrc to $olddir/.bashrc"
		mv ~/.bash_profile $olddir
		ln -s $DOTFILES_ROOT/.bashrc ~/
	fi
echo ""

echo "## Creating XDG direxctories!"
xdg-user-dirs-update
echo ""
echo "## Copying Wallpapers!"
cp -r $DOTFILES_ROOT/Wallpapers ~/Pictures
