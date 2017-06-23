set nocompatible              " be iMproved, required

"================Vundle================

filetype off                  " Vundle required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Bundle 'Raimondi/delimitMate'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'steffanc/cscopemaps.vim'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'vim-scripts/taglist.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'embear/vim-localvimrc'
Bundle 'junegunn/vim-easy-align'
Bundle 'Chiel92/vim-autoformat'

call vundle#end()            " required
filetype plugin indent on    " required


"================General================

set nu
set backspace=indent,eol,start
set shiftwidth=4
set tabstop=4

set cursorline
hi CursorLine cterm=reverse
set cc=79,99
hi CursorColumn cterm=NONE

syn on
set expandtab

set statusline=2
set laststatus=2

set ruler
"set nowrapscan
set nobackup

"----------------Key mappings----------------
" Copy-to/Paste-from system clipboard
vmap <leader>c "+y
vmap <leader>v "+p
nmap <leader>v "+p
"imap <leader>v <esc>"+p




"================Plugins================

"----------------solarized----------------
set background=dark
colorscheme solarized

"----------------nerdtree----------------
map <Leader>n :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
autocmd vimenter * wincmd w
"let NERDTreeWinPos="right"

"----------------nerdtree-tabs----------------
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_autofind=1

"----------------syntastic----------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
hi SyntasticErrorSign cterm=NONE ctermfg=red
hi SyntasticWarningSign cterm=NONE ctermfg=red
let g:syntastic_error_symbol = 'xx'
let g:syntastic_warning_symbol = '!!'
autocmd FileType c,cpp,python,java sign define dummy
autocmd FileType c,cpp,python,java execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')


"----------------YCM----------------
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_global_ycm_extra_conf=$HOME . "/.vim/.ycm_global_ycm_extra_conf.py"
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu

"----------------taglist----------------
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = 'name'
let Tlist_Process_File_Always = 1
let Tlist_Update = 1
map <Leader>t :TlistToggle<CR>

"----------------nerdcommenter----------------
let g:NERDSpaceDelims=1
let g:NERDCommentWholeLinesInVMode=1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'

"-------------vim-easy-align--------------
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

"----------------vim-localvimrc----------------
let g:localvimrc_ask=0

"-------------vim-better-whitespace------------
highlight ExtraWhitespace ctermbg=red
map <Leader>sw :StripWhitespace<CR>

"------------------vim-autoformat--------------
noremap <F3> :Autoformat<CR>
let b:formatdef_custom_cpp='"clang-format -style=Google"'
let b:formatters_cpp=['custom_cpp']

"================Language specific================
"
"----------------C++----------------
au FileType cpp set shiftwidth=2
au FileType cpp set tabstop=2

