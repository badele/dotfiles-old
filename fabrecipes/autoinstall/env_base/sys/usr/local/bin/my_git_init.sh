#!/bin/bash

DST=git@192.168.253.53
PRJ=$1

if [ "$PRJ" == "" ]; then
	echo "veuillez saisir un nom de projet"
	exit
fi

if [ ! -d ~/projets/$PRJ ]; then
	# Creation du repertoire
	mkdir ~/projets/$PRJ
	cd ~/projets/$PRJ

	# Création du repository
	git init
	cd ~/projets

	# Clone et copie du repository vers le depot local
	git clone --bare $PRJ $PRJ.git
	scp -r ~/projets/$PRJ.git $DST:

	# Suppression des projet temporaire
	rm -r ~/projets/$PRJ
	rm -r ~/projets/$PRJ.git

	echo ""
	echo "[Optionnel] git clone $DST:$PRJ.git"
	echo "[Optionnel] git remote add github git@github.com:badele/$PRJ.git"
else
	echo "le projet existe déja !"
fi




