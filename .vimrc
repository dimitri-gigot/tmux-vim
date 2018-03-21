set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" https://github.com/VundleVim/Vundle.vim
Plugin 'VundleVim/Vundle.vim'
" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

"-------------------------------------------------------------------------
syntax on
set number
set foldcolumn=1
set smarttab
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
set encoding=utf-8
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

"colors molokai "https://github.com/tomasr/molokai
colors happy_hacking "https://github.com/YorickPeterse/happy_hacking.vim

set tabstop=2 shiftwidth=2 expandtab
set showcmd
set cursorline
set showmatch
set incsearch 
set hlsearch  "highlight search
set foldenable  " enable folding
set foldlevelstart=99   " open most folds by default

set mouse=a

nnoremap <space> za
nnoremap <cr> :noh<CR><CR>:<backspace>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

noremap Q !!sh<CR>


"-------------------------------------------------------------------------
" - select all the document
function DIMselectAll()
    normal! gg0vG$
    echo '🤘 All the document is now selected'
endfunction

" - copy all the document
function DIMcopyAll()
    :%y+
    echo '🤘 All the document is now copied'
endfunction

" - javascript one line comment
function DIMjsOneComment()
    normal! mm0wi//
    normal! `m
    echo '🙈 This line is now commented (javascript)'
endfunction

function DIMaddComa()
    normal!  mm$a;
    normal! `m
endfunction

" - javascript multi line comment
function DIMjsMultiComment()
    echo '🙈 These lines are now commented (javascript)'
endfunction

" - reindent
function DIMindent()
    normal! mmgg=G`m
    echo '🤖 Code is now indented properly'
endfunction

function DIMtest()
    echo system('ls')
endfunction
nnoremap ,t :call DIMtest()<cr>

" Remap DIM function
nnoremap ,a :call DIMselectAll()<cr>
nnoremap ,c :call DIMcopyAll()<cr>
nnoremap ,/ :call DIMjsOneComment()<cr>
nnoremap ,I :call DIMindent()<cr>
nnoremap ,; :call DIMaddComa()<cr>

"replace all occurence of the current word
nnoremap ,r :%s/<c-r><c-w>//gc<c-f>$F/i
nnoremap ,s <Esc>:w<cr>
"nnoremap ,n yy:r !node ~/code/vimstuff/nodetest.js "<c-r>0" <CR>
nnoremap ,n :r !node ~/code/vimstuff/nodetest.js "<c-r><c-w>" <CR>
nnoremap ,b :r !node ~/code/vimstuff/nodetest.js 

nnoremap ,x :!clear && node  %:p <CR>
" Remap Escape to go on ,, in all Modes
map ,, <Esc>
imap ,, <Esc>
