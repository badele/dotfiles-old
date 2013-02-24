#!/bin/bash

add_pkg ()
{
    for p in "$@";
    do
        pacman -Qi $p >/dev/null 2>&1
        if [ $? -eq 1 ]; then
	        if [ "$PKG" != "" ]; then
                  PKG="$PKG $p"
                else
                  PKG="$p"
                fi
        fi
    done
}

install_pkg ()
{
    if [ "$PKG" != "" ]; then
        echo "Installation de: yaourt -S '$PKG'"
        yaourt -S $PKG
    fi
}

