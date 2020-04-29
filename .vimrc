set clipboard=unnamedplus
set autoindent
set number
set ignorecase
set smartcase
"set nowrap

set nobackup
set noswapfile

" background color on visual mode for monokai theme in terminal
hi Visual term=reverse cterm=reverse guibg=Green

:set expandtab
":retab
set tabstop=4
set shiftwidth=4
set softtabstop=4

au FileType python setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" gui
set guioptions-=T "remove toolbar

set nocompatible
filetype off

filetype plugin indent on

