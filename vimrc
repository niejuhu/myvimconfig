set nocompatible
set backspace=2
" For terminator
" set t_BE=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Remap leader
let mapleader = ','

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
command! W w !sudo tee % > /dev/null

set cc=80
highlight ColorColumn ctermbg=darkgray

aut FileType cpp,c set shiftwidth=2 expandtab
aut FileType cpp,c set tabstop=2 expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.DS_Store

" Always show current position
set ruler

" Search
set hlsearch
set incsearch
"map <client> <leader><cr> :noh<cr>
map <leader>/ :noh<cr>

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

set so=7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    colorscheme desert
catch
endtry
set background=dark
set encoding=utf8
set ffs=unix,mac,dos

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set autoindent
set smartindent
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 100
" set lbr
" set tw=100
" set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffers, windows and tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>tt :tabnext
map <leader>tp :tabprev

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug manager
call plug#begin('~/.vim/plugged')
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/LeaderF'
Plug 'Raimondi/delimitMate'
Plug 'Chiel92/vim-autoformat'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
call plug#end()

" tags
set tags=./.tags;,.tags


" vim-gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

let g:gutentags_ctags_tagfile = '.tags'

let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif


" asyncrun
let g:asyncrun_open = 10
let g:asyncrun_bell = 1
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']

nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
nnoremap <silent> <F9> :AsyncRun g++ -std=c++11 -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" && "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <F8> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <F7> :AsyncRun -cwd=<root> -raw make run <cr>
nnoremap <silent> <F6> :AsyncRun -cwd=<root> make <cr>


" ale
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
highlight ALEErrorSign ctermfg=DarkRed
highlight ALEWarningSign ctermfg=Yellow

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_executable = 'g++'
let g:ale_cpp_gcc_options = '-std=c++11 -Wall -Iinclude'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_python_pylint_executable = 'python3'
let g:ale_python_pylint_options = '-m pylint'
let g:ale_python_pylint_use_global = 1

let g:ale_linters = {
			\   'c': ['gcc'],
			\   'cpp': ['g++'],
			\   'python': ['pylint'],
			\}

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" YCM
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_complete_in_comments=1
let g:ycm_key_invoke_completion = '<C-z>'
set completeopt=menu,menuone
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'


noremap <C-z> <NOP>

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java': ['re!\w{2}'],
			\ }


" LeaderF
let g:Lf_ShortcutF = '<C-p>'
let g:Lf_ShortcutB = '<C-n>'
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" delimitMate
au FileType python let b:delimitMate_nesting_quotes = ['"']
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" autoformat
noremap <F3> :Autoformat<cr>
" au BufWrite * :Autoformat
"let g:autoformat_verbosemode=1
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:formatdef_my_custom_cpp = '"clang-format --style=Google"'
let g:formatters_c = ['my_custom_cpp']
let g:formatters_cpp = ['my_custom_cpp']


" NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
