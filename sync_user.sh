#!/bin/bash

# Mise a jours des sources
cd ~/dotfiles
git pull

# synchronise le depot
rsync -avr --exclude ".git/" --cvs-exclude ~/dotfiles/user/ ~/

# Changement des droits
chmod 755 ~/.local/bin/my_*

source ~/.bashrc


