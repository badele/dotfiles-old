#!/bin/bash

source ~/dotfiles/system/usr/local/bin/dotfiles.sh

# Mise a jours des sources
git --git-dir=~dotfiles/ pull

# synchronise le depot
rsync -avr --exclude ".git/" --cvs-exclude ~/dotfiles/user/ ~/

# Changement des droits
sudo chmod 755 /usr/local/bin/my_*

# Locale
sudo locale-gen

# Console
install_pkg tmux screenfetch-git rxvt-unicode terminus-font

# Environement X
install_pkg xf86-input-synaptics xorg-xev xorg-xprop slim slim-themes

# i3 tilling
install_pkg i3-wm i3lock i3status dmenu

# Autres outils
install_pkg chromium xchat
install_pkg remmina freerdp

# Alternative legere
install_pkg feh
install_pkg gnome-icon-theme gvfs gvfs-smb thunar thunar-volman 
install pkg gigolo intltool
install_pkg wicd wicd-gtk
install_pkg clipit
install_pkg volumeicon

# Active les services
sudo systemctl enable slim.service
sudo systemctl enable wicd.service


source ~/.bashrc


