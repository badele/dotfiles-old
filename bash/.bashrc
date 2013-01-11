#
# ~/.bashrc
#

export EDITOR="nano"

/usr/bin/screenfetch

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Virtualenv wrapper
export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
source ~/.local/bin/virtualenvwrapper.sh

if [ -d ~/.local/bin ]; then
  export PATH=~/.local/bin:$PATH
fi
