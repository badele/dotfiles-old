#!/bin/bash

# Mise a jours des sources
cd ~/dotfiles
git pull

# synchronise le depot
rsync -avr --exclude ".git/" --exclude "sync_dotfiles.sh" . ~

source ~/.bashrc


