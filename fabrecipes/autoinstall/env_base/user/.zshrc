# If not running interactively, do not do anything
[[ $- != *i* ]] && return
# [[ -z "$TMUX" ]] && exec tmux

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="af-magic"
#ZSH_THEME="random"
ZSH_THEME="rkj"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias prj_fabrecipe="workon fabtools && cd /LIVE/projects/fabrecipes/fabrecipes"
alias prj_blogjsl="workon pelican && cd /LIVE/projects/blog.jesuislibre.org"
alias prj_badim="workon pelican && cd /LIVE/projects/bruno.adele.im"
alias prj_cacause="workon cacause && cd /LIVE/projects/cacause"
alias prj_jobcatcher="workon jobcatcher && cd /LIVE/projects/JobCatcher"
alias prj_githubsum="workon githubsum && cd /LIVE/projects/github-summary"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git virtualenvwrapper )

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
# # Virtualenv wrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
. virtualenvwrapper.sh

if [ -d ~/.local/bin ]; then
  export PATH=~/.local/bin:$PATH
fi
