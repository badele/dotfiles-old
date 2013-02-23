#!/bin/bash

source ~/dotfiles/system/usr/local/bin/dotfiles.sh

PKG=""
DEPOT=$HOME/dotfiles

# Mise a jours des sources
git --git-dir=$DEPOT/.git --work-tree=$DEPOT pull

# synchronise le depot
sudo rsync -avr --exclude ".git/"  $DEPOT/system/ /
rsync -avr --exclude ".git/" --cvs-exclude $DEPOT/user/ ~/

# Console
add_pkg tmux zsh screenfetch-git rxvt-unicode terminus-font

# Environement X
add_pkg xf86-input-synaptics xorg-xev xorg-xprop slim slim-themes gksu arandr

# i3 tilling
add_pkg i3-wm i3lock i3status dmenu

# Autres outils
add_pkg chromium xchat
add_pkg remmina freerdp
add_pkg mc

# Alternative legere
add_pkg feh
add_pkg zathura zathura-pdf-mupdf
add_pkg gnome-icon-theme gvfs gvfs-smb thunar thunar-volman 
add_pkg gigolo
add_pkg wicd wicd-gtk
add_pkg clipit
add_pkg volumeicon

install_pkg

# Changement des droits
sudo chmod 755 /usr/local/bin/my_*

# Locale
sudo locale-gen

# Active les services
sudo systemctl enable slim.service
sudo systemctl enable wicd.service

source ~/.bashrc
