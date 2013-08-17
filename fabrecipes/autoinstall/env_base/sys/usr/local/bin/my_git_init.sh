#!/bin/bash

DST=git@192.168.253.53
DISK=$1
PRJ=$2

if [ "$PRJ" == "" ]; then
	echo "veuillez saisir un montage ZFS et un nom de projet"
	exit
fi

if [ ! -d /$DISK/projects/$PRJ ]; then
	# Creation du repertoire
	mkdir /$DISK/projects/$PRJ
	cd /$DISK/projects/$PRJ

	# Création du repository
	git init
	cd /$DISK/projects

	# Clone et copie du repository vers le depot local
	git clone --bare $PRJ $PRJ.git
	scp -r /$DISK/projects/$PRJ.git $DST:

	# Suppression des projet temporaire
	rm -r /$DISK/projects/$PRJ
	rm -r /$DISK/projects/$PRJ.git

	echo ""
	echo "[Optionnel] git clone $DST:$PRJ.git"
	echo "[Optionnel] git remote add github git@github.com:badele/$PRJ.git"
else
	echo "le projet existe déja !"
fi
