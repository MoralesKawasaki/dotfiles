#!/bin/bash 

dir=~/dotfiles
olddir=~/dotfiles_old
files="alacritty dwm dwmblocks kitty picom rofi"
install="alacritty kitty rofi git vim feh playerctl xorg xorg-server xorg-xinit xorg-xrandr yazi pcmanfm ttf-noto-nerd xdg=user-dirs"
aur="picom-git librewolf-bin"

echo -n "Installing all official and AUR packages ..."
sudo pacman -S  $install && yay -S  $aur
echo "done"

echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $files; do
    echo "Moving any existing dotfiles from ~/.config to $olddir"
    mv ~/.config/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file ~/.config/$file
done

echo "Installing Starship ..."
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> ~/.bashrc
echo "done"

echo "Creating symlink to starship.toml in ~/.config/"
ln -s $dir/starship.toml ~/.config/

echo "Creating symlink to .xinitrc in home directory"
ln -s $dir/.xinitrc ~/

echo "Creating xdg directories and copying wallpapers to ~/Pictures"
xdg-user-dirs-update
cp $dir/Wallpapers/* ~/Pictures/
echo "done"
