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
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'

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

" nerdtree-tabs
let g:nerdtree_tabs_open_on_console_startup=1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
hi SyntasticWarningSign cterm=NONE ctermfg=yellow
autocmd FileType c,cpp,python,java sign define dummy
autocmd FileType c,cpp,python,java execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" YCM
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
autocmd FileType c let g:ycm_global_ycm_extra_conf=$HOME . "/.vim/.ycm_global_c_ycm_extra_conf.py"
autocmd FileType cpp let g:ycm_global_ycm_extra_conf=$HOME . "/.vim/.ycm_global_cpp_ycm_extra_conf.py"
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu

" solarized
set background=dark
colorscheme solarized

" Not Plugin
set nu
set tabstop=4
set shiftwidth=4

set backspace=indent,eol,start

set cursorline
hi CursorLine cterm=reverse
set cc=100
hi CursorColumn cterm=NONE

syn on
autocmd FileType c,cpp,java,python set expandtab
set foldmethod=syntax
set foldlevelstart=99

set statusline+=%l         " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
set statusline+=%=        " Switch to the right side
set statusline+=%f        " Path to the file

