#!/bin/bash

# Mise a jours des sources
cd ~/dotfiles
git pull

# synchronise le depot
sudo rsync -navr --exclude ".git/"  ./system/ /
sudo ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime

# Locale
sudo locale-gen

source ~/.bashrc


