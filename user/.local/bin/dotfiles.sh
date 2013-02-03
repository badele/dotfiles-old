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

    if [ $INSTALL -eq 1 ]; then
        echo "Installation de: $PKG"
        sudo yaourt -S $PKG
    fi
}
