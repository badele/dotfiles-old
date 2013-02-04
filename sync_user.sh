#!/bin/bash

# Mise a jours des sources
git --git-dir=~dotfiles/ pull

# synchronise le depot
rsync -avr --exclude ".git/" --cvs-exclude ~/dotfiles/user/ ~/

source ~/.bashrc


