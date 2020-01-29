if filereadable(expand('~/.config/nvim/plugins.vim'))
    source ~/.config/nvim/plugins.vim
endif

set wildmenu
set backspace=indent,eol,start
set gdefault
set encoding=UTF-8
let mapleader=","
set binary
set noeol
set modeline
set modelines=4
set exrc
set secure
set number
syntax on
set cursorline
set ts=4
set sw=4
set mouse=a
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set noerrorbells
set nostartofline
set ruler
set shortmess=atI
set showmode
set title
set showcmd
set expandtab
set autoindent
set smartindent
set noshowmode
set background=dark
set foldmethod=syntax
set viminfo="/Users/cavery/.viminfo"

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir " Store undo files in here

if !has('gui_running')
  set t_Co=256
endif

let g:netrw_winsize = -28
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*'

nmap <C-t> :Lexplore <CR>
imap <C-t> :Lexplore <CR>
nnoremap <Space> za
nnoremap <C-b> :GitMessenger <CR>
nnoremap <C-k> :DD <CR>
nnoremap <C-l> :Denite gitlog:all <CR>
nmap <C-w> :w <CR>
imap <C-w> :w <CR>
nnoremap <C-x> :bd <CR>
nnoremap <C-n> :bn <CR>
nnoremap <C-m> :bp <CR>
nnoremap <C-F> :CtrlSF 

" Write to read only file
cmap w!! w !sudo tee % >/dev/null