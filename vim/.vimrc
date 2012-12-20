set nocompatible               " no vi compatible
filetype off                   " for vundle

" Vundle plugin
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'Lokaltog/powerline' 
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bash-support.vim'               
Bundle 'Align'                         
Bundle 'blackboard.vim'               
Bundle 'molokai'                     
                                    
Bundle 'Tabular'                    
Bundle 'Figlet.vim'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
Bundle 'comments.vim'
Bundle 'tpope/vim-fugitive'
"Bundle 'refactor'

if $TERM !="linux" && $TERM != "xterm"
  Bundle 'godlygeek/csapprox'

end

filetype plugin on
filetype plugin indent on     " required!

" Colorscheme
syntax enable
set background=dark
"colorscheme blackboard 
"colorscheme solarized

" activation du colorscheme sous gvim ou sous vim (console)
if !exists('my_colors_name')
  let my_colors_name = "molokai"   " change this variable (here or in the vimrc)
  " if you want to try a different colorscheme
endif
if has('gui_running') || &t_Co < 88        " only load 'special' terminal colors if the terminal
  " supports them  AND we aren't starting the GUI
  exe 'colorscheme' my_colors_name
elseif exists(':CSApproxSnapshot') == 2    " CSApprox installed and working
  " Note: this implicitly tests has('gui')
  let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
  exe 'colorscheme' my_colors_name
elseif exists(':GuiColorScheme') == 2      " no CSApprox, but we have guicolorscheme installed
  exe 'GuiColorScheme' my_colors_name
else                                       " software support is lacking
  exe 'colorscheme' my_colors_name
endif
set cursorline
highlight CursorLine ctermbg=blue
set guifont=Monospace\ 10

" Custom
set number                    " show numbers lines
set ruler                     " Show the line and column number 
set encoding=utf8             " use UTF8
set ignorecase
set showcmd

" search
set wrapscan " search at top afert end line
set hls " hightlight


" affichage des caracteres invisible
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set nolist

" manual wraping
set textwidth=78     " terminal width
set colorcolumn=+1   " show color at textwith + 1
set nowrap           " no wraping in visual
set formatoptions=cq " for manual wraping
"highlight ColorColumn ctermbg=green guibg=darkred

" Indent
set tabstop=2
set expandtab " convert tab to space
set shiftwidth=2
set smartindent
set autoindent

"mouse support
set mouse=a

" taglist plugin
let Tlist_Use_Right_Window = 1
nnoremap <F12> :TlistToggle<CR>

" nerdtree plugin
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=30
inoremap <C-Space> <C-n>
nnoremap  <C-n> :NERDTreeToggle<CR>

" make option
if !exists(':MS')
  command MS execute ':w' | execute ':make'
endif
