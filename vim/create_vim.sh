#!/bin/bash - 
#===============================================================================
#
#          FILE: create_vim.sh
# 
#         USAGE: ./create_vim.sh 
# 
#   DESCRIPTION: Create the vim profile from git source
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Bruno Adele <bruno.adele@jesuislibre.org>
#  ORGANIZATION: jesuislibre.org
#       CREATED: 12/20/12 16:13:03 CET
#      REVISION:  ---
#===============================================================================


#Get git repository
SRC=`dirname $0`

#Création du profil
ln -s $SRC/.vimrc ~/.vimrc

# Ne pas oublier de d'executer depuis vim
#:BundleClean
#:BundleInstall
