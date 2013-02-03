#!/bin/bash

# Mise a jours des sources
cd ~/dotfiles
git pull

# synchronise le depot
rsync -avr --exclude ".git/" --exclude "sync_dotfiles.sh" ./user/ ~

# Changement des droits
chmod 755 ~/.local/bin/my_*

source ~/.bashrc


