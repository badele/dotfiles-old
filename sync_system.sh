#!/bin/bash

# Mise a jours des sources
git --git-dir=~dotfiles/ pull

# synchronise le depot
sudo rsync -avr --exclude ".git/"  ./system/ /
sudo ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime

#source ~/.bashrc


