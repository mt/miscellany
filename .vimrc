set nocompatible "break compatibility with vi

set directory=C:\\tmp,C:\\temp,~/.vim/tmp "Create swap files in tmpdir
set backupdir=C:\\tmp,C:\\temp,~/.vim/tmp "Create backup files in tmpdir
set nobackup "don't create backup files

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#infect()
filetype plugin indent on

" change the mapleader from \ to ,
" let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>

set encoding=utf8
set linebreak " Don't break lines in the middle of a word
set nowrap
set tabstop=4 shiftwidth=4 " tabs are 4 spaces, same for auto indent

set expandtab smarttab "save tabs as spaces
set ruler showmatch showmode
set autoindent copyindent "automatically indent and copy indent from previous line
set pastetoggle=<F2>
set smartcase "ignore case if search pattern is all lowercase

set listchars=trail:◌,eol:¬

" map *.md to markdown instead of modula2
au BufRead,BufNewFile *.md set filetype=markdown

" -- Gui options --------------------------------------------------------------

if &t_Co >= 256 || has("gui_running")
    "colorscheme inkpot
    colorscheme mustang
else
    "colorscheme desert
    colorscheme molokai
endif

if has("gui_running")
    if has("mac")
        set guifont=Monaco:h14
    else
        set guifont=Consolas:h12:cANSI
    endif
endif

if &t_Co > 2 || has("gui_running")
   syntax on
endif
