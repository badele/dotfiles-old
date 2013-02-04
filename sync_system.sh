#!/bin/bash

# Mise a jours des sources
cd ~/dotfiles
git pull

# synchronise le depot
sudo rsync -avr --exclude ".git/"  ./system/ /
sudo ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime

# Changement des droits
sudo chmod 755 /usr/local/bin/my_*

# Locale
sudo locale-gen

source ~/.bashrc


