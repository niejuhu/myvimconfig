set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Bundle 'Raimondi/delimitMate'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

call vundle#end()            " required
filetype plugin indent on    " required

" Plugins settings
" nerdcommenter
let NERDSpaceDelims=1
let NERDCommentWholeLinesInVMode=1

" nerdtree
map <Leader>n :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd vimenter * wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let NERDTreeWinPos="right"

"nerdtree-tabs
let g:nerdtree_tabs_open_on_console_startup=1

set nu
set tabstop=4
set shiftwidth=4

set background=dark
colorscheme solarized

set cursorline
hi CursorLine cterm=reverse
set cc=100
hi CursorColumn cterm=NONE

syn on
autocmd FileType c,cpp,java,python set expandtab
set foldmethod=syntax
set foldlevelstart=99
