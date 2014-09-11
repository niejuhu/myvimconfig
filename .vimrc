"================================
" Filename:	.vimrc
" Author:	NIEJuhu
" Email:	niejuhu@gmail.com
" Created:	2013-12-10
" Note:		A lot of code is bor-
" rowed from web resources.

"===========general==============
set nocompatible
set nu
set tabstop=4

" Status bar
set laststatus=2      " always show status bar
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction
set statusline=%=\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}

"============program=============
syn on
set autoindent
set smartindent
set shiftwidth=4
set ai
set foldmethod=syntax
set foldlevel=100
set cc=101
"set cursorline
"hi CursorLine cterm=NONE ctermbg=darkgray
hi ColorColumn cterm=NONE ctermbg=darkgray
noremap <C-c> :s/^/\/\/<CR>
noremap <C-x> :s/^\/\//<CR>

"au FileType c,cpp,java call Pair()
"au FileType c,cpp,h,java,smali set expandtab
set expandtab

function Pair()
	inoremap ( ()<Esc>i
	inoremap [ []<Esc>i
	inoremap { {<CR>}<Esc>O
	inoremap ) <c-r>=ClosePair(')')<CR>
	inoremap ] <c-r>=ClosePair(']')<CR>
	inoremap } <c-r>=CloseBracket()<CR>
	inoremap " <c-r>=QuoteDelim('"')<CR>
	inoremap ' <c-r>=QuoteDelim("'")<CR>
endf

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf

"======Window Manager======
nmap wv <C-w>v
nmap ws <C-w>s
nmap wc <C-w>c
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

let g:winManagerWindowLayout='FileExplorer,BufExplorer|TagList'
nmap wm :WMToggle<cr>

"==========TagList========
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
