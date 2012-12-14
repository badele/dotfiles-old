set nocompatible               " be iMproved
filetype off                   " required!

" Vundle plugin
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Others bundle modules
Bundle 'Lokaltog/powerline'
Bundle "scrooloose/syntastic"
Bundle 'altercation/vim-colors-solarized'
Bundle 'bash-support.vim'
Bundle 'Align'


filetype plugin on
filetype plugin indent on     " required!

" Solarized theme
syntax enable
set background=dark
colorscheme solarized

" Custom
set number                    " show numbers lines
set ruler                     " Show the line and column number 
set encoding=utf8             " use UTF8
set textwidth=70


" affichage des caracteres invisible
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

" Indent
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
set autoindent

"mouse support
set mouse=a
