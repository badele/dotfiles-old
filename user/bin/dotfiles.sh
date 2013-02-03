#!/bin/bash

install_pkg ()
{
    PKG=""
    INSTALL=0
    for p in "$@";
    do
        pacman -Qi $p > /dev/null
        if [ $? -eq 1 ]; then
	        PKG="$PKG $p"
            INSTALL=1
        fi
    done
    echo "Installation de: $PKG"

    if [ $INSTALL -eq 1 ]; then
        yaourt -S $PKG
    fi
}
