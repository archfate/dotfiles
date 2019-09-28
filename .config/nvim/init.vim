let mapleader =","

" Vim-plug{{{
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'potatoesmaster/i3-vim-syntax'
Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
call plug#end()"}}}

" set color scheme
set background=light
"colorscheme solarized
"set t_Co=256  
set rtp+=$GOROOT/misc/vim<Left>
" General settings and Misc{{{
" Enable autocompletion:
set wildmode=longest,list,full
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Split window below and to the right
set splitbelow splitright

" Necesary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.  I love this!
syntax on
set showcmd

" show the matching part of the pair for [] {} and ()
set showmatch

" Unicode
set encoding=utf-8
" Folding Stuffs
set foldmethod=marker

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
set grepprg=grep\ -nH\ $*

" Line Numbers PWN!
set number relativenumber

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" Spaces are better than a tab character
set expandtab
set smarttab

" Who doesn't like autoindent?
set autoindent

" clipboard require gvim installed
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
set clipboard+=unnamedplus

" mouse cusor
set mouse=a"}}}

" Spaces and Tabs{{{
set expandtab
set textwidth=80
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftwidth=4
set softtabstop=4

if has("autocmd")
    " Enable file type detection
    filetype on
    autocmd FileType c setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType vim setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab 
endif"}}}

set wrap
nnoremap <silent> <leader>wr <ESC>:set wrap!<CR><ESC>


" enable all Python syntax highlighting features
let python_highlight_all = 1

" NerDTree set and key.{{{
"" autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" ShowHidden dotfiles in NerdTree
let NERDTreeShowHidden=1"}}}

" vimwiki with markdown support{{{
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax }}}

" Leader key{{{
" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

"temporary turn off hlsearch
map <leader>noh :noh <CR>"}}}

" Check file in shellcheck:
map <leader>s :!clear && shellcheck %<CR>

" Key mapping/remapping and autocmd BufWritePost etc{{{
" Toggle background dark||light
map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
"vmap <C-c> "+yi
"vmap <C-x> "+c
"vmap <C-v> c<ESC>"+p
"imap <C-v> <C-r><C-o>+

" autocmd
map <F2> <Esc>:w<CR>:!filename.py<CR>

" Python ide via ll 
:vnoremap <f5> :!python<CR>
autocmd FileType python nnoremap \ll :!python %<cr>

" mpv <F8> 
map <F8> :exec '!nohup mpv ' . shellescape(getline('.'), 1) . ' >/dev/null 2>&1&'<CR><CR>

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd"}}}
